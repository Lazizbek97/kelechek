import 'package:flutter/material.dart';
import 'package:kelechek/core/constants/app_colors.dart';

class CstOutlinedButton extends StatelessWidget {
  const CstOutlinedButton({
    required this.text,
    required this.onPressed,
    super.key,
  });

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(double.infinity, 48),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: AppColors.primaryColor),
        ),
      ),
      child: Text(text),
    );
  }
}
