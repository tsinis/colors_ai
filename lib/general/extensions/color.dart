import 'dart:ui' show Color;

import '../models/typedef_aliases/int_rgb_color.dart';
import 'constants.dart';

extension ColorExtensions on Color {
  IntRGBColor toListInt() => [red, green, blue];

  String toHex() => (value & 0xFFFFFF).toRadixString(16).padLeft(6, '0').toUpperCase();

  Color contrastColor() {
    // Lightness formula https://en.wikipedia.org/wiki/HSL_and_HSV#Lightness
    final double darkness = 1 - (redMultiplier * red + greenMultiplier * green + blueMultiplier * blue) / 255;
    return (darkness < lightnessLimit) ? darkColor : lightColor;
  }
}
