import 'package:flutter/material.dart';
import 'package:kelechek/core/extentions/extentions.dart';

import 'package:kelechek/core/extentions/number_formatters.dart';

class AppHelpers {
  AppHelpers._();
  static const specialSpaceCharacter = ' ';

  static String formatNumber(
    num number, {
    BuildContext? context,
    int roundUpTo = 1,
    bool useSpecChar = false,
  }) {
    final isNegative = number.isNegative;
    final newNumber = number.abs();

    var result = '0';
    if (context == null) {
      result = newNumber.formatWithThousandsSeparator();
    } else {
      result = NumberFormatter.formatter(newNumber.toDouble(), context);
    }

    return isNegative ? '-$result' : result;
  }
}
