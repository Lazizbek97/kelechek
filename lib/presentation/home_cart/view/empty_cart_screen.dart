import 'package:flutter/material.dart';
import 'package:kelechek/app/service_locators.dart';
import 'package:kelechek/core/common/widgets/cst_button.dart';
import 'package:kelechek/core/common/widgets/custom_image_view.dart';
import 'package:kelechek/core/constants/app_images.dart';
import 'package:kelechek/core/constants/constants.dart';
import 'package:kelechek/core/utils/hive_service.dart';
import 'package:kelechek/l10n/l10n.dart';
import 'package:kelechek/presentation/user_indentification/view/user_passport_and_id_selection_screen.dart';

class EmptyCardScreen extends StatelessWidget {
  const EmptyCardScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10 = context.l10n;
    final user = getIt<HiveService>().getUser;
    final userNotRegistered = user == null || user.fulllName.isEmpty;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(),
        Column(
          children: [
            const CustomImageView(
              imagePath: AppImagePaths.emptyContent,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              l10.empty_cart_msg,
              style: AppTextStyle.s16W400.copyWith(
                color: AppColors.lightGray,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        if (userNotRegistered)
          CstButton(
            text: l10.add_data,
            onPressed: () {
              Navigator.push(context, UserPassportIdSelectionScreen.route());
            },
          )
        else
          const SizedBox(),
      ],
    );
  }
}
