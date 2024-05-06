import 'package:flutter/material.dart';
import 'package:kelechek/core/common/widgets/custom_image_view.dart';
import 'package:kelechek/core/constants/constants.dart';

class CstListTile extends StatelessWidget {
  const CstListTile({
    required this.onPressed,
    required this.imagePath,
    required this.title,
    super.key,
  });

  final VoidCallback onPressed;
  final String imagePath;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      splashColor: AppColors.lightBlue,
      leading: Container(
        height: 40,
        width: 40,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: AppColors.gray4.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 16,
            ),
          ],
        ),
        child: CustomImageView(
          imagePath: imagePath,
          width: 20,
          height: 20,
          color: AppColors.darkBlue,
        ),
      ),
      title: Text(
        title,
        style: AppTextStyle.s16,
      ),
      trailing: const CustomImageView(
        imagePath: AppIcon.arrowRight,
      ),
      onTap: onPressed,
    );
  }
}
