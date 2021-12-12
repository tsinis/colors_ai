import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'color_palette.g.dart';

@HiveType(typeId: 0)
class ColorPalette extends Equatable {
  @HiveField(0)
  final List<Color> colors;

  @override
  List<Object?> get props => <Object?>[colors];

  const ColorPalette({this.colors = const <Color>[]});
}
