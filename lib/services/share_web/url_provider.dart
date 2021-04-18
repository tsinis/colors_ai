import 'dart:ui' show Color;

import '../../extensions/color_to_hex.dart';
import '../../models/hive/color_palette.dart';

part 'providers/art_google.dart';
part 'providers/colordesigner.dart';
part 'providers/colordot.dart';
part 'providers/coolors.dart';
part 'providers/icolorpalette.dart';
part 'providers/muzli_colors.dart';
part 'providers/palettable.dart';
part 'providers/poolors.dart';

abstract class ColorsUrlProvider {
  const ColorsUrlProvider(
    this.palette, {
    required this.baseUrl,
    required this.providerName,
    this.formats = '',
    this.separateSymbol = '-',
  });
  final ColorPalette palette;
  final String baseUrl, separateSymbol, formats, providerName;

  String get url {
    final StringBuffer sb = StringBuffer()..write(baseUrl);
    for (final Color color in palette.colors) {
      sb..write(color.toHex().toLowerCase())..write(separateSymbol);
    }
    return sb.toString().substring(0, sb.length - 1);
  }
}
