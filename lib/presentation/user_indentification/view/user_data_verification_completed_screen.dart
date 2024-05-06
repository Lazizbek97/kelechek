import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kelechek/core/common/widgets/cst_button.dart';
import 'package:kelechek/core/common/widgets/custom_image_view.dart';
import 'package:kelechek/core/constants/app_images.dart';
import 'package:kelechek/core/constants/constants.dart';
import 'package:kelechek/l10n/l10n.dart';
import 'package:kelechek/presentation/main_app/cubit/main_app_cubit.dart';
import 'package:kelechek/presentation/main_app/main_app_screen.dart';
import 'package:kelechek/presentation/user_indentification/view/current_order_details_screen.dart';

class UserDataVerificationCompleted extends StatelessWidget {
  const UserDataVerificationCompleted({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(
      builder: (_) => const UserDataVerificationCompleted(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final appState = context.select((MainAppCubit cubit) => cubit.state);
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomImageView(
                  imagePath: AppImagePaths.userDataVerificationDone,
                ),
                const SizedBox(height: 20),
                Text(
                  l10n.data_verification_completed_successfully,
                  style: AppTextStyle.s19,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Text(
                  ' ${l10n.your_data_verification_completed_successfully_you_can_now_continue_purchases}',
                  style: AppTextStyle.s16W400.copyWith(
                    color: AppColors.lightGray,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
          child: CstButton(
            text: l10n.continue_text,
            onPressed: () {
              if (appState.currentPage == 'cart') {
                Navigator.pushAndRemoveUntil(
                  context,
                  MainAppScreen.route(appState.rentalOption!),
                  (route) => false,
                );
              } else {
                Navigator.pushReplacement(
                  context,
                  CurrentOrderDetailsScreen.route(
                      appState.currentOrder!, false),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
