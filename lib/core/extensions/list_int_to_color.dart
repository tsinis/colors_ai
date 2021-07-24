import 'dart:ui' show Color;

import '../models/typedef_aliases/int_rgb_color.dart';

extension ColorExtension on IntRGBColor {
  Color toColor() =>
      (length == 3) ? Color.fromRGBO(this[_red], this[_green], this[_blue], 1) : const Color.fromRGBO(128, 128, 128, 1);
}

const int _red = 0, _green = 1, _blue = 2;
