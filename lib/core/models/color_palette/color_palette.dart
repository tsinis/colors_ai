import 'dart:ui';

import 'package:hive/hive.dart';

part 'color_palette.g.dart';

@HiveType(typeId: 0)
class ColorPalette {
  @HiveField(0)
  final List<Color> colors;

  const ColorPalette({this.colors = const []});
}
