part of '../colors_url_provider.dart';

class ColorCombos extends ColorsUrlProvider {
  const ColorCombos() : super(baseUrl: 'www.colorcombos.com/combotester.html?', separateSymbol: '&', formats: 'PNG +');

  @override
  String url(ColorPalette palette) {
    int index = 0;
    final StringBuffer sb = StringBuffer(_fullUrl);
    for (final Color color in palette.colors) {
      sb
        ..write('color$index=')
        ..write(color.toHex().toLowerCase())
        ..write(_separateSymbol);
      index++;
    }

    return sb.toString().substring(0, sb.length - 1);
  }
  // Example: https://www.colorcombos.com/combotester.html?color0=005B9A&color1=0191C8&color2=74C2E1&color3=7c1313&color4=8C8984.
}
