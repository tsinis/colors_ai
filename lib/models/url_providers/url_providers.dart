import 'dart:ui' show Color;

import '../../extensions/color_to_hex.dart';
import '../hive/color_palette.dart';

part '../../models/url_providers/providers/art_google.dart';
part '../../models/url_providers/providers/colordesigner.dart';
part '../../models/url_providers/providers/colordot.dart';
part '../../models/url_providers/providers/coolors.dart';
part '../../models/url_providers/providers/icolorpalette.dart';
part '../../models/url_providers/providers/muzli_colors.dart';
part '../../models/url_providers/providers/palettable.dart';
part '../../models/url_providers/providers/poolors.dart';

abstract class ColorsUrlProvider {
  const ColorsUrlProvider({
    required this.baseUrl,
    this.providerName,
    this.formats = '',
    this.separateSymbol = '-',
  });
  final String baseUrl, separateSymbol;
  final String? providerName, formats;

  String url(ColorPalette palette) {
    final StringBuffer sb = StringBuffer()..write(baseUrl);
    for (final Color color in palette.colors) {
      sb..write(color.toHex().toLowerCase())..write(separateSymbol);
    }
    return sb.toString().substring(0, sb.length - 1);
  }

  String get name => providerName ?? runtimeType.toString();
}
