import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kelechek/core/common/widgets/cst_empty_screen.dart';
import 'package:kelechek/core/common/widgets/custom_image_view.dart';
import 'package:kelechek/core/constants/constants.dart';
import 'package:kelechek/l10n/l10n.dart';
import 'package:kelechek/presentation/home/data/rental_option.dart';
import 'package:kelechek/presentation/home/view/home_screen.dart';
import 'package:kelechek/presentation/rental_home_with_service/cubit/home_and_service_rental_cubit.dart';
import 'package:kelechek/presentation/rental_home_with_service/domain/repository/rental_home_and_service_repository.dart';
import 'package:kelechek/presentation/rental_home_with_service/utils/rental_home_and_service_fitler_payload.dart';
import 'package:kelechek/presentation/rental_home_with_service/widgets/rental_home_service_card_widget.dart';
import 'package:kelechek/presentation/rental_home_with_service/widgets/rental_home_service_filter_sheet.dart';

class RentalHomeWithServiceScreen extends StatelessWidget {
  const RentalHomeWithServiceScreen({required this.rentalOption, super.key});
  final RentalOption rentalOption;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocProvider(
      create: (context) => HomeAndServiceRentalCubit(
        rentalHomeRepository: RentalHomeAndServiceRepository(),
      )..fetchInitialData(),
      child: BlocConsumer<HomeAndServiceRentalCubit, HomeAndServiceRentalState>(
        listener: (context, state) {
          if (state.errorMassage.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMassage),
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const CustomImageView(
                  imagePath: AppIcon.menu,
                  width: 24,
                  height: 24,
                ),
                onPressed: () {
                  Navigator.push(context, HomeScreen.route());
                },
              ),
              title: Text(rentalOption.title),
              actions: [
                IconButton(
                  icon: Badge(
                    smallSize: 10,
                    backgroundColor: AppColors.primaryColor,
                    isLabelVisible: (state.filter?.filterCount ?? 0) > 0,
                    child: const CustomImageView(
                      imagePath: AppIcon.sliders,
                      width: 24,
                      height: 24,
                    ),
                  ),
                  onPressed: () async {
                    // ignore: inference_failure_on_function_invocation
                    await showCupertinoModalPopup(
                      context: context,
                      builder: (context) => RentalHomeServiceFilterSheet(
                        filter: state.filter ??
                            RentalHomeServiceFilterPayload.initial(),
                      ),
                    ).then((value) {
                      if (value != null) {
                        context
                            .read<HomeAndServiceRentalCubit>()
                            .filter(value as RentalHomeServiceFilterPayload);
                      }
                    });
                  },
                ),
              ],
            ),
            body: state.rentalHomeAndServiceMdList.isEmpty
                ? const CstEmptyScreen()
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            '${state.rentalHomeAndServiceMdList.length} ${l10n.premises}',
                            style: AppTextStyle.s10.copyWith(
                              color: AppColors.lightGray,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Expanded(
                          child: ListView.separated(
                            itemCount: state.rentalHomeAndServiceMdList.length,
                            itemBuilder: (context, index) =>
                                RentalHomeServiceCardWidget(
                              rentalHomeAndServiceMd:
                                  state.rentalHomeAndServiceMdList[index],
                            ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}
