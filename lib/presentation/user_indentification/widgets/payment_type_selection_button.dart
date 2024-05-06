import 'package:flutter/material.dart';
import 'package:kelechek/core/common/widgets/custom_image_view.dart';
import 'package:kelechek/core/constants/constants.dart';
import 'package:kelechek/l10n/l10n.dart';

class PaymentTypeSelectionButton extends StatelessWidget {
  const PaymentTypeSelectionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.EBF2FF,
        elevation: 0,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            l10n.bank_card,
            style: AppTextStyle.s13.copyWith(
              color: AppColors.blueGray,
            ),
          ),
          const CustomImageView(
            imagePath: AppIcon.arrowDown,
          ),
        ],
      ),
    );
  }
}
