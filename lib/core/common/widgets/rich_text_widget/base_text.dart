import 'package:flutter/material.dart';

import 'package:kelechek/core/common/widgets/rich_text_widget/highlighted_text.dart';
import 'package:kelechek/core/common/widgets/rich_text_widget/link_text.dart';

@immutable
class BaseText {
  const BaseText({
    required this.text,
    this.textStyle,
  });

  factory BaseText.plain({
    required String text,
    TextStyle? style,
  }) =>
      BaseText(
        text: text,
        textStyle: style,
      );

  factory BaseText.link({
    required String text,
    required VoidCallback onTap,
    TextStyle? style = const TextStyle(
      color: Colors.blue,
      decoration: TextDecoration.underline,
    ),
  }) =>
      LinkText(
        text: text,
        textStyle: style,
        onTap: onTap,
      );

  factory BaseText.highlighted({
    required String text,
    TextStyle? style,
  }) =>
      HighlightedText(
        text: text,
        textStyle: style,
      );
  final String text;
  final TextStyle? textStyle;
}
