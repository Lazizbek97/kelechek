import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kelechek/core/common/widgets/cst_button.dart';
import 'package:kelechek/core/common/widgets/custom_image_view.dart';
import 'package:kelechek/core/constants/app_images.dart';
import 'package:kelechek/core/constants/constants.dart';
import 'package:kelechek/l10n/l10n.dart';
import 'package:kelechek/presentation/main_app/cubit/main_app_cubit.dart';
import 'package:kelechek/presentation/main_app/main_app_screen.dart';

class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(
      builder: (_) => const PaymentSuccessScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final mainCubit = context.select((MainAppCubit value) => value);

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomImageView(
                imagePath: AppImagePaths.congrats,
              ),
              const SizedBox(height: 20),
              Text(
                l10n.congrats_your_payment_went_successful,
                style: AppTextStyle.s19,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Text(
                l10n.thanks_for_payment_msg,
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
            context.read<MainAppCubit>().changeIndex(3);
            Navigator.pushAndRemoveUntil(
              context,
              MainAppScreen.route(mainCubit.state.rentalOption!),
              (route) => false,
            );
          },
        ),
      ),
    );
  }
}
