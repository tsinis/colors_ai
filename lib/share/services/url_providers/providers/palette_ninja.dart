part of '../url_providers.dart';

class PalleteNinja extends ColorsUrlProvider {
  const PalleteNinja() : super(baseUrl: 'palette.ninja/', separateSymbol: '-', formats: 'Chrome Extension');

  @override
  String url(ColorPalette palette) {
    final StringBuffer sb = StringBuffer(_fullUrl);
    for (final Color color in palette.colors) {
      sb
        ..write('#')
        ..write(color.toHex().toLowerCase())
        ..write(separateSymbol);
    }

    return _removeLastChar(sb.toString());
  }
  // https://palette.ninja/#f67509-#f6d409-#dc1408-#430602-#f61609
}
