part of '../colors_url_provider.dart';

/// Example: https://palette.ninja/#f67509-#f6d409-#dc1408-#430602-#f61609.
class PaletteNinja extends ColorsUrlProvider {
  const PaletteNinja({super.baseUrl = 'palette.ninja/', super.formats = 'Chrome Extension'});

  @override
  String url(ColorPalette palette) {
    final StringBuffer sb = StringBuffer(_fullUrl);
    for (final Color color in palette.colors) {
      sb
        ..write('#')
        ..write(color.toHex().toLowerCase())
        ..write(_separateSymbol);
    }

    return _removeLastChar(sb.toString());
  }
}
