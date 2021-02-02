import 'dart:ui' show Color;

import '../models/hive_adapters/color_list.dart';

extension ColorListExtension on List<Color> {
  ColorList toColorList() => ColorList()..list = this;
}
