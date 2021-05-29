import 'dart:ui' show Color;

import '../models/color_palette/color_palette.dart';

extension ColorPaletteExtension on List<Color> {
  ColorPalette toPalette() => ColorPalette(colors: this);
}
