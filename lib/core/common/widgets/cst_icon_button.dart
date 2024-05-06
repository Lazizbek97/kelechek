import 'package:flutter/material.dart';
import 'package:kelechek/core/common/widgets/custom_image_view.dart';
import 'package:kelechek/core/constants/constants.dart';

class CstIconButton extends StatelessWidget {
  const CstIconButton({
    super.key,
    this.onPressed,
    this.imagePath,
  });

  final VoidCallback? onPressed;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 40,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(8),
        ),
        child: CustomImageView(
          imagePath: imagePath,
          color: AppColors.white,
        ),
      ),
    );
  }
}
