import 'package:flutter/material.dart';
import 'package:kelechek/core/common/widgets/cst_button.dart';
import 'package:kelechek/core/common/widgets/custom_image_view.dart';
import 'package:kelechek/core/constants/app_images.dart';
import 'package:kelechek/core/constants/app_text_style.dart';
import 'package:kelechek/core/constants/constants.dart';
import 'package:kelechek/l10n/l10n.dart';

class UserDataVerificationFailed extends StatelessWidget {
  const UserDataVerificationFailed({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(
      builder: (_) => const UserDataVerificationFailed(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomImageView(
                imagePath: AppImagePaths.smthWentWrong,
              ),
              const SizedBox(height: 20),
              Text(
                l10n.unfortunately_data_not_verified,
                style: AppTextStyle.s19,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Text(
                l10n.please_make_sure_you_entered_correct_data_msg,
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
          text: l10n.retry,
          onPressed: () {
            // Navigator.push(context, UserDataVerificationFailed.route());
          },
        ),
      ),
    );
  }
}
