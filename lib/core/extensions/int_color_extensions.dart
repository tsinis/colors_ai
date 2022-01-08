import 'dart:ui' show Color;

import '../models/typedef_aliases/int_rgb_color.dart';

extension IntColorExtensions on IntRGBColor {
  static const int _red = 0;
  static const int _green = 1;
  static const int _blue = 2;
  static const double _opacity = 1;

  static const Color kFallbackColor = Color.fromRGBO(128, 128, 128, _opacity);

  Color toColor() => (length == 3) ? Color.fromRGBO(this[_red], this[_green], this[_blue], _opacity) : kFallbackColor;
}
