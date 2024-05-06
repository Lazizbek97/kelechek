import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kelechek/core/constants/constants.dart';

class CstChipWidget extends StatelessWidget {
  const CstChipWidget({
    required this.onSelected,
    required this.isSelected,
    required this.label,
    super.key,
    this.padding,
    this.bgColor,
    this.borderColor,
  });
  final bool isSelected;
  final String label;
  final void Function(bool) onSelected;
  final EdgeInsetsGeometry? padding;
  final Color? bgColor;
  final Color? borderColor;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        canvasColor: Colors.transparent,
        splashColor:
            bgColor?.withOpacity(0.5) ?? AppColors.lightBlue.withOpacity(0.5),
        highlightColor:
            bgColor?.withOpacity(0.5) ?? AppColors.lightBlue.withOpacity(0.5),
      ),
      child: RawChip(
        padding: padding ??
            EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 10.w,
            ),
        showCheckmark: false,
        labelPadding: EdgeInsets.zero,
        label: Text(
          label,
          style: GoogleFonts.roboto(
            color: isSelected ? AppColors.white : AppColors.blueGray,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor:
            isSelected ? bgColor ?? AppColors.lightBlue : Colors.transparent,
        selectedColor: bgColor ?? AppColors.lightBlue,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: borderColor ?? AppColors.gray5,
          ),
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        selected: isSelected,
        onSelected: onSelected,
      ),
    );
  }
}
