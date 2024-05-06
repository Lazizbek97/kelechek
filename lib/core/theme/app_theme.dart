import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kelechek/core/constants/app_colors.dart';

class AppTheme {
  static OutlineInputBorder _border([
    Color color = AppColors.inputBorderColor,
  ]) =>
      OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
        ),
        borderRadius: BorderRadius.circular(12),
      );

  static final lightThemeMode = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Roboto',
  ).copyWith(
    scaffoldBackgroundColor: AppColors.backgroundColor,
    // textTheme: TextStyleTextTheme(),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.backgroundColor,
      titleTextStyle: TextStyle(
        color: AppColors.appbarTextColor,
        fontSize: 19,
        fontWeight: FontWeight.w600,
      ),
    ),
    chipTheme: ChipThemeData(
      color: const MaterialStatePropertyAll(
        AppColors.backgroundColor,
      ),
      side: BorderSide.none,
      labelStyle: TextStyle(
        color: AppColors.appbarTextColor,
        fontWeight: FontWeight.w500,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(27),
      border: _border(),
      enabledBorder: _border(),
      focusedBorder: _border(AppColors.inputFocusedBorderColor),
      errorBorder: _border(AppColors.inputErrorBorderColor),
      focusedErrorBorder: _border(AppColors.inputErrorBorderColor),
      errorStyle: TextStyle(
        color: AppColors.inputErrorBorderColor,
        fontWeight: FontWeight.w400,
      ),
      suffixStyle: TextStyle(
        color: AppColors.suffixTextColor,
        fontWeight: FontWeight.w400,
        fontSize: 17,
      ),
      prefixStyle: TextStyle(
        color: AppColors.prefixTextColor,
        fontWeight: FontWeight.w400,
        fontSize: 17,
      ),
      hintStyle: TextStyle(
        color: AppColors.hintTextColor,
        fontWeight: FontWeight.w400,
        fontSize: 17,
      ),
    ),
    primaryTextTheme: const TextTheme(
      labelLarge: TextStyle(
        color: AppColors.white,
        fontWeight: FontWeight.w500,
        fontSize: 17,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppColors.buttonColor),
        foregroundColor: MaterialStateProperty.all(AppColors.white),
        textStyle: MaterialStateProperty.all(
          TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.w500,
            fontSize: 17,
          ),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.buttonColor,
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          TextStyle(
            color: AppColors.buttonColor,
            fontWeight: FontWeight.w500,
            fontSize: 17,
          ),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        side: MaterialStateProperty.all(
          const BorderSide(
            color: AppColors.buttonColor,
          ),
        ),
      ),
    ),
    cupertinoOverrideTheme: CupertinoThemeData(
      primaryColor: AppColors.primaryColor,
      brightness: Brightness.light,
      barBackgroundColor: AppColors.backgroundColor,
      textTheme: CupertinoTextThemeData(
        navTitleTextStyle: TextStyle(
          color: AppColors.appbarTextColor,
          fontSize: 19,
        ),
      ),
    ),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: AppColors.backgroundColor,
      headerHeadlineStyle: TextStyle(
        color: AppColors.calendarTextColor,
        fontSize: 19,
        fontWeight: FontWeight.w600,
      ),
      headerHelpStyle: TextStyle(
        color: AppColors.calendarTextColor,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      dayStyle: TextStyle(
        color: AppColors.calendarTextColor,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      weekdayStyle: TextStyle(
        color: AppColors.calendarTextColor,
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
      yearStyle: TextStyle(
        color: AppColors.calendarTextColor,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all(AppColors.white),
      trackColor: MaterialStateProperty.all(AppColors.green),
      trackOutlineColor: MaterialStateProperty.all(Colors.transparent),
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: AppColors.primaryColor,
      height: 64,
      surfaceTintColor: AppColors.primaryColor,
      shape: CircularNotchedRectangle(),
      padding: EdgeInsets.zero,
    ),
    dividerColor: AppColors.lightGray,
  );
}
