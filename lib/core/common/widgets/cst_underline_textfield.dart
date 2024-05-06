import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kelechek/core/constants/constants.dart';

class CstUnderlineTextField extends StatelessWidget {
  const CstUnderlineTextField({
    super.key,
    this.controller,
    this.hintText,
    this.label,
    this.keyboardType,
    this.suffixText,
    this.prefixText,
    this.prefixIcon,
    this.textAlign = TextAlign.start,
    this.floatingLabelBehavior,
    this.contentPadding,
    this.suffixIcon,
    this.validator,
  });
  final TextEditingController? controller;
  final String? hintText;
  final String? label;
  final TextInputType? keyboardType;
  final String? suffixText;
  final String? prefixText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextAlign textAlign;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final EdgeInsetsGeometry? contentPadding;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      textAlign: textAlign,
      style: AppTextStyle.s16.copyWith(
        color: AppColors.blueGray,
      ),
      maxLines: null,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        suffix: Text(
          suffixText ?? '',
          style: AppTextStyle.s16.copyWith(
            color: AppColors.blueGray,
          ),
        ),
        label: Text(
          label ?? '',
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        prefixText: prefixText,
        prefixIconConstraints: const BoxConstraints(),
        floatingLabelBehavior:
            floatingLabelBehavior ?? FloatingLabelBehavior.auto,
        floatingLabelStyle: GoogleFonts.roboto(
          fontSize: 10,
          color: AppColors.lightGray,
        ),
        labelStyle: AppTextStyle.s16.copyWith(
          color: AppColors.blueGray,
        ),
        hintStyle: AppTextStyle.s16.copyWith(
          color: AppColors.lightGray,
        ),
        contentPadding: contentPadding ??
            const EdgeInsets.symmetric(
              vertical: 10,
            ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.lightGray,
          ),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(),
        border: const UnderlineInputBorder(),
      ),
    );
  }
}
