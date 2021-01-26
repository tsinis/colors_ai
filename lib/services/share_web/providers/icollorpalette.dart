import 'dart:ui';
import '../url_provider.dart';

class IColorPalette extends ColorsUrlProvider {
  IColorPalette(List<Color> colors) : super(colors, baseUrl: 'https://icolorpalette.com/', separateSymbol: '_');
  // https://icolorpalette.com/fef301_ffe102_fccc04_ffb402_f99006
}
