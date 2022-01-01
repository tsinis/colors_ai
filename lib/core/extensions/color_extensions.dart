import 'dart:ui' show Color;

import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../models/typedef_aliases/int_rgb_color.dart';
import 'constants.dart';

extension ColorExtensions on Color {
  IntRGBColor toListInt() => List<int>.unmodifiable(<int>[red, green, blue]);

  String toHex() => colorToHex(this, enableAlpha: false);

  Color contrastColor() => useWhiteForeground(this) ? kLightColor : kDarkColor;
}
