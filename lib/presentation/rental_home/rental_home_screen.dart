import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kelechek/core/common/widgets/cst_empty_screen.dart';
import 'package:kelechek/core/common/widgets/custom_image_view.dart';
import 'package:kelechek/core/common/widgets/sct_loading_overlay.dart';
import 'package:kelechek/core/constants/constants.dart';
import 'package:kelechek/l10n/l10n.dart';
import 'package:kelechek/presentation/home/data/rental_option.dart';
import 'package:kelechek/presentation/home/view/home_screen.dart';
import 'package:kelechek/presentation/rental_home/cubit/home_rental_cubit.dart';
import 'package:kelechek/presentation/rental_home/domain/repository/rental_home_repository.dart';
import 'package:kelechek/presentation/rental_home/rental_home_filter_payload.dart';
import 'package:kelechek/presentation/rental_home/widgets/rental_home_card_widget.dart';
import 'package:kelechek/presentation/rental_home/widgets/rental_home_filter.dart';

class RentalHomeSceen extends StatelessWidget {
  const RentalHomeSceen({required this.rentalOption, super.key});

  final RentalOption rentalOption;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocProvider(
      create: (context) => HomeRentalCubit(
        rentalHomeRepository: RentalHomeRepository(),
      )..fetchInitialData(),
      child: BlocConsumer<HomeRentalCubit, HomeRentalState>(
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
                      builder: (context) => RentalHomeFilterSheet(
                        filter:
                            state.filter ?? RentalHomeFilterPayload.initial(),
                      ),
                    ).then((value) {
                      if (value != null) {
                        context.read<HomeRentalCubit>().filter(
                              value as RentalHomeFilterPayload,
                            );
                      }
                    });
                  },
                ),
              ],
            ),
            body: CstLoadingOverlay(
              isLoading: state.isLoading,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        '${state.rentalHousesMdList.length} ${l10n.premises}',
                        style: AppTextStyle.s10.copyWith(
                          color: AppColors.lightGray,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: state.rentalHousesMdList.isEmpty
                          ? const CstEmptyScreen()
                          : ListView.separated(
                              itemCount: state.rentalHousesMdList.length,
                              itemBuilder: (context, index) =>
                                  RentalHomeCardWidget(
                                rentalHousesMd: state.rentalHousesMdList[index],
                              ),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 16),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
