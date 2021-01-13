import 'dart:ui' show Color;

import 'constants.dart';

extension ColorExtension on List<int> {
  Color toColor() =>
      (length == 3) ? Color.fromRGBO(this[_red], this[_green], this[_blue], 1) : const Color.fromRGBO(128, 128, 128, 1);
  Color contrastColor() {
    // Lightness formula https://en.wikipedia.org/wiki/HSL_and_HSV#Lightness
    final double darkness =
        1 - (redMultiplier * this[_red] + greenMultiplier * this[_green] + blueMultiplier * this[_blue]) / 255;
    return (darkness < lightnessLimit) ? darkColor : lightColor;
  }
}

const int _red = 0, _green = 1, _blue = 2;
