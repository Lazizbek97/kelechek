import 'package:flutter/material.dart';
import 'package:kelechek/core/common/widgets/custom_image_view.dart';
import 'package:kelechek/core/constants/constants.dart';

class PaymentButton extends StatelessWidget {
  const PaymentButton({
    required this.iconPath,
    required this.ontap,
    super.key,
  });

  final String iconPath;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        onPressed: ontap,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: AppColors.black,
        ),
        child: CustomImageView(
          imagePath: iconPath,
        ),
      ),
    );
  }
}
