import 'dart:ui' show Color;
import '../../extensions/color_to_hex.dart';

part 'providers/colordesigner.dart';
part 'providers/muzli_colors.dart';
part 'providers/coolors.dart';
part 'providers/palettable.dart';
part 'providers/art_google.dart';
part 'providers/poolors.dart';
part 'providers/colordot.dart';
part 'providers/icolorpalette.dart';

abstract class ColorsUrlProvider {
  const ColorsUrlProvider(
    this.colors, {
    required this.baseUrl,
    required this.providerName,
    this.formats = '',
    this.separateSymbol = '-',
  });
  final List<Color> colors;
  final String baseUrl, separateSymbol, formats, providerName;

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
