import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kelechek/core/common/widgets/cst_empty_screen.dart';
import 'package:kelechek/core/common/widgets/custom_image_view.dart';
import 'package:kelechek/core/constants/constants.dart';
import 'package:kelechek/l10n/l10n.dart';
import 'package:kelechek/presentation/home/data/rental_option.dart';
import 'package:kelechek/presentation/home/view/home_screen.dart';
import 'package:kelechek/presentation/hunting_farm/cubit/hunting_rental_cubit.dart';
import 'package:kelechek/presentation/hunting_farm/domain/repository/hunting_rental_repository.dart';
import 'package:kelechek/presentation/hunting_farm/utils/hunting_filter_payload.dart';
import 'package:kelechek/presentation/hunting_farm/widgets/hunting_filter_sheet.dart';
import 'package:kelechek/presentation/hunting_farm/widgets/rental_hunting_card_widget.dart';

class HuntingFarmsScreen extends StatelessWidget {
  const HuntingFarmsScreen({required this.rentalOption, super.key});

  final RentalOption rentalOption;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocProvider(
      create: (context) => HuntingRentalCubit(
        rentalHuntingRepository: RentalHuntingRepository(),
      )..fetchInitialData(),
      child: BlocConsumer<HuntingRentalCubit, HuntingRentalState>(
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
                    isLabelVisible:
                        (state.huntingFilterPayload?.filterCount ?? 0) > 0,
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
                      builder: (context) => HuntingFilterSheet(
                        huntingFilter: state.huntingFilterPayload ??
                            HuntingFilterPayload.initial(),
                      ),
                    ).then((value) {
                      if (value != null) {
                        context
                            .read<HuntingRentalCubit>()
                            .filter(value as HuntingFilterPayload);
                      }
                    });
                    // Navigator.push(context, UserProfileScreen.route());
                  },
                ),
              ],
            ),
            body: state.rentalHuntingMdList.isEmpty
                ? const CstEmptyScreen()
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            '${state.rentalHuntingMdList.length} ${l10n.premises}',
                            style: AppTextStyle.s10.copyWith(
                              color: AppColors.lightGray,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Expanded(
                          child: ListView.separated(
                            itemCount: state.rentalHuntingMdList.length,
                            itemBuilder: (context, index) =>
                                RentalHuntingCardWidget(
                              rentalHuntingMd: state.rentalHuntingMdList[index],
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
