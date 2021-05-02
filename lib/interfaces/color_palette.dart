import '../models/hive/color_palette.dart';

abstract class ColorPaletteInterface {
  const ColorPaletteInterface();

  ColorPalette get asPalette => const ColorPalette();
  void fromPalette(ColorPalette palette);
}
