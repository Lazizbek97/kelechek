import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:kelechek/presentation/rent_office_premises/widgets/chevron_btn.dart';

import '../../../core/constants/app_text_style.dart';

CalendarDatePicker2WithActionButtonsConfig getCustomConfig() {
  return CalendarDatePicker2WithActionButtonsConfig(
    calendarType: CalendarDatePicker2Type.range,
    selectedDayHighlightColor: const Color(0XFF719FFF),
    dayBorderRadius: BorderRadius.circular(8),
    weekdayLabelTextStyle: const TextStyle(
      color: Colors.black87,
      fontWeight: FontWeight.bold,
    ),
    controlsTextStyle: AppTextStyle.s14.copyWith(
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    dayTextStyle: AppTextStyle.s14.copyWith(
      color: Colors.black,
      fontWeight: FontWeight.w500,
    ),
    selectedDayTextStyle: AppTextStyle.s14.copyWith(
      color: Colors.white,
      fontWeight: FontWeight.w500,
    ),
    todayTextStyle: AppTextStyle.s14.copyWith(
      color: Color(0XFF719FFF),
      fontWeight: FontWeight.w500,
    ),
    lastMonthIcon: const CustomChevronBtn(
      icon: Icon(
        Icons.keyboard_double_arrow_left,
        color: Colors.black,
      ),
    ),
    nextMonthIcon: const CustomChevronBtn(
      icon: Icon(
        Icons.keyboard_double_arrow_right,
        color: Colors.black,
      ),
    ),
    disableModePicker: false,
    centerAlignModePicker: true,
  );
}
