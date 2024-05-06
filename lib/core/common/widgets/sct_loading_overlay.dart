import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kelechek/core/constants/app_colors.dart';

class CstLoadingOverlay extends StatelessWidget {
  const CstLoadingOverlay({
    required this.child,
    required this.isLoading,
    super.key,
  });

  final Widget child;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading)
          Material(
            color: Colors.white.withOpacity(
              0.72,
            ),
            child: const Center(
              child: CupertinoActivityIndicator(
                radius: 16,
                color: AppColors.lightBlue,
              ),
            ),
          ),
      ],
    );
  }
}
