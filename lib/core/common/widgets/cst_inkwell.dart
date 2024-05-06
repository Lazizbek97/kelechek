import 'package:flutter/material.dart';
import 'package:kelechek/core/constants/constants.dart';

class CustomInkWell extends StatelessWidget {
  const CustomInkWell({
    required this.onTap,
    required this.child,
    this.pressedColor,
    super.key,
    this.color,
    this.padding,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
  });

  final VoidCallback onTap;
  final Color? color;
  final Widget child;
  final Color? pressedColor;
  final EdgeInsetsGeometry? padding;
  final void Function(TapDownDetails)? onTapDown;
  final void Function()? onTapCancel;
  final void Function(TapUpDetails)? onTapUp;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: InkWell(
        onTapDown: onTapDown,
        onTapCancel: onTapCancel,
        onTapUp: onTapUp,
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        splashColor: pressedColor ?? AppColors.lightBlue,
        highlightColor: pressedColor?.withOpacity(0.5) ??
            AppColors.lightBlue.withOpacity(0.5),
        child: Ink(
          padding: padding ?? const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: color ?? AppColors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: AppColors.gray4.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}
