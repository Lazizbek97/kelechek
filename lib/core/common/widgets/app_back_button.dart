import 'package:flutter/material.dart';
import 'package:kelechek/core/common/widgets/custom_image_view.dart';
import 'package:kelechek/core/constants/constants.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({
    super.key,
    this.iconPath = AppIcon.arrowBack,
    this.onPressed,
    this.color ,
  });

  final String iconPath;
  final VoidCallback? onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: CustomImageView(
        imagePath: iconPath,
        width: 24,
        height: 24,
        color: color,
      ),
      onPressed: () {
        if (onPressed != null) {
          onPressed!();
        } else {
          Navigator.pop(context);
        }
      },
    );
  }
}
