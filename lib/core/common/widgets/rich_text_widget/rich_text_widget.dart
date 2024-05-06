import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:kelechek/core/common/widgets/rich_text_widget/base_text.dart';
import 'package:kelechek/core/common/widgets/rich_text_widget/link_text.dart';

class RichTextWidget extends StatelessWidget {
  const RichTextWidget({
    required this.texts,
    super.key,
    this.styleForAll,
    this.textAlign,
    this.maxLines,
  });

  final TextStyle? styleForAll;
  final Iterable<BaseText> texts;
  final TextAlign? textAlign;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign ?? TextAlign.center,
      maxLines: maxLines,
      text: TextSpan(
        style: styleForAll,
        children: texts.map(
          (e) {
            if (e is LinkText) {
              return TextSpan(
                text: e.text,
                style: e.textStyle,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    e.onTap();
                  },
              );
            }
            return TextSpan(
              text: e.text,
              style: e.textStyle,
            );
          },
        ).toList(),
      ),
    );
  }
}
