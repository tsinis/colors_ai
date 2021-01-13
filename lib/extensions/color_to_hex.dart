import 'dart:ui' show Color;
import 'constants.dart';

extension ColorHex on Color {
  String toHex() => (value & 0xFFFFFF).toRadixString(16).padLeft(6, '0').toUpperCase();
  Color contrastColor() {
    // Lightness formula https://en.wikipedia.org/wiki/HSL_and_HSV#Lightness
    final double darkness = 1 - (redMultiplier * red + greenMultiplier * green + blueMultiplier * blue) / 255;
    return (darkness < lightnessLimit) ? darkColor : lightColor;
  }
}
