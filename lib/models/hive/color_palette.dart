import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

part 'color_palette.g.dart';

@HiveType(typeId: 0)
class ColorPalette {
  const ColorPalette({this.colors = const []});

  @HiveField(0)
  final List<Color> colors;
}
