import 'package:flutter/material.dart';
import 'package:kelechek/core/common/widgets/custom_image_view.dart';
import 'package:kelechek/core/constants/app_icons.dart';

class CstEmptyScreen extends StatelessWidget {
  const CstEmptyScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Center(
        child: CustomImageView(
          imagePath: AppIcon.empty,
        ),
      ),
    );
  }
}
