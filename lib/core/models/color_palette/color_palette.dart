import 'dart:ui';

import 'package:hive/hive.dart';

import '../../../color_generator/interfaces/manipulate_list_interface.dart';

part 'color_palette.g.dart';

@HiveType(typeId: 0)
class ColorPalette extends ManipulateListInterface<Color> {
  @HiveField(0)
  final List<Color> colors;

  const ColorPalette({this.colors = const <Color>[]}) : super(colors);
}
