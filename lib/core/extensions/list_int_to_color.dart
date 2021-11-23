import 'dart:ui' show Color;

import '../models/typedef_aliases/int_rgb_color.dart';

extension ColorExtension on IntRGBColor {
  Color toColor() => (length == 3)
      ? Color.fromRGBO(this[_red], this[_green], this[_blue], _opacity)
      : const Color.fromRGBO(
          128,
          128,
          128,
          _opacity,
        );
}

const int _red = 0;
const int _green = 1;
const int _blue = 2;

const double _opacity = 1;
