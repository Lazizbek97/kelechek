import 'package:flutter/foundation.dart' show immutable;

import 'base_text.dart';

@immutable
class HighlightedText extends BaseText {
  const HighlightedText({
    required super.text,
    super.textStyle,
  });
}
