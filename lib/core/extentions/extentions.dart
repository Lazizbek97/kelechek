import 'dart:developer';

import 'package:intl/intl.dart';

extension DateTimeFormattingExtension on DateTime? {
  String? formatToDDMMYYYY() {
    if (this == null) {
      return null;
    }
    try {
      return DateFormat('dd.MM.yyyy').format(this!);
    } catch (e) {
      log(e.toString());
    }
    return '-';
  }

  int? daysBetween(DateTime? other) {
    if (this == null || other == null) {
      return null;
    }
    final difference = other.difference(this!);
    return difference.inDays;
  }

  String formatInStyle(String format) {
    if (this == null) {
      return '';
    }
    try {
      return DateFormat(format).format(this!);
    } catch (e) {
      log(e.toString());
    }
    return '';
  }
}

extension StringNumber on num? {
  num? roundToIntIfZeroDecimal({bool ceil = false}) {
    final list = toString().split('.');
    if (list.length > 1 && ceil) {
      final last = list.last[0];
      if (last == '9') {
        return int.parse(toString().split('.').first) + 1;
      }
    }
    return int.tryParse(
          toString().split('.').first,
        ) ??
        0;
  }

  String toStringZeroNum() {
    return (toString().trim().isEmpty
        ? '0'
        : this == null
            ? '0'
            : toString());
  }

  String formatWithThousandsSeparator() {
    final stringValue = toString();
    final isNegative = (this ?? 0).isNegative;

    final parts = stringValue.split('.');
    final wholePart = parts[0];
    final decimalPart = parts.length > 1 ? parts[1] : '';

    final regex = RegExp(r'\B(?=(\d{3})+(?!\d))');
    var formattedWholePart =
        wholePart.replaceAllMapped(regex, (match) => '${match.group(0)} ');

    if (isNegative) {
      formattedWholePart = formattedWholePart.startsWith('-')
          ? formattedWholePart
          : '-$formattedWholePart';
    }

    if (decimalPart == '0') {
      return formattedWholePart;
    } else if (decimalPart.isNotEmpty) {
      return '$formattedWholePart.$decimalPart';
    } else {
      return formattedWholePart;
    }
  }
}

extension DateTimeFormatting on DateTime {
  String formatCustomDateTime(String languageCode) {
    final localizedMonths = _months[languageCode] ?? _months['en']!;
    final month = localizedMonths[this.month - 1];

    final day = this.day.toString().padLeft(2, '0');
    final year = this.year.toString();

    final hour = this.hour.toString().padLeft(2, '0');
    final minute = this.minute.toString().padLeft(2, '0');

    return '$day $month $year; $hour:$minute';
  }

  String formatInLocaleStyle(String format) {
    try {
      return DateFormat(format).format(this);
    } catch (e) {
      log(e.toString());
    }
    return '';
  }
}

extension NumberParsing on String {
  num toNum() {
    var parsedNum = num.tryParse(replaceAll(RegExp('[^-0-9.]'), ''));
    if (parsedNum == null) {
      final dotNum = replaceAll(',', '.');
      parsedNum = num.tryParse(dotNum) ?? 0;
    }
    return parsedNum;
  }

  DateTime toDateTime() {
   
    return DateTime.tryParse(this) ?? DateTime.now();
  }
}

final _months = {
  'en': [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ],
  'ru': [
    'января',
    'февраля',
    'марта',
    'апреля',
    'мая',
    'июня',
    'июля',
    'августа',
    'сентября',
    'октября',
    'ноября',
    'декабря',
  ],
  'ky': [
    'январь',
    'февраль',
    'март',
    'апрель',
    'май',
    'июнь',
    'июль',
    'август',
    'сентябрь',
    'октябрь',
    'ноябрь',
    'декабрь',
  ],
};
