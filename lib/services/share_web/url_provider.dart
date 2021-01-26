import 'dart:ui';

import '../../extensions/color_to_hex.dart';

abstract class ColorsUrlProvider {
  ColorsUrlProvider(this.colors, {required this.baseUrl, this.separateSymbol = '-'});
  final List<Color> colors;
  final String baseUrl, separateSymbol;

  String get url {
    final StringBuffer sb = StringBuffer();
    // ignore: cascade_invocations
    sb.write(baseUrl);
    for (final Color color in colors) {
      sb..write(color.toHex().toLowerCase())..write(separateSymbol);
    }
    return sb.toString().substring(0, sb.length - 1);
  }
}
