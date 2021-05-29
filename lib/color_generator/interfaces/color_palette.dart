import '../../general/models/color_palette/color_palette.dart';

abstract class ColorPaletteInterface {
  const ColorPaletteInterface();

  ColorPalette toPalette();
  void fromPalette(ColorPalette palette);
}
