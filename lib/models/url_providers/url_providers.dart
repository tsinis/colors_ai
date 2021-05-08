import 'dart:ui' show Color;

import '../../extensions/color_to_hex.dart';
import '../hive/color_palette.dart';

part '../../models/url_providers/providers/art_google.dart';
part '../../models/url_providers/providers/colordesigner.dart';
part '../../models/url_providers/providers/colordot.dart';
part '../../models/url_providers/providers/coolors.dart';
part '../../models/url_providers/providers/color_combos.dart';
part '../../models/url_providers/providers/muzli_colors.dart';
part '../../models/url_providers/providers/palettable.dart';
part '../../models/url_providers/providers/poolors.dart';

abstract class ColorsUrlProvider {
  const ColorsUrlProvider({
    required this.baseUrl,
    this.providerName,
    this.formats,
    this.separateSymbol = '-',
  });

  final String? providerName, formats;
  final String baseUrl, separateSymbol;

  String url(ColorPalette palette) {
    final StringBuffer sb = StringBuffer()..write(baseUrl);
    for (final Color color in palette.colors) {
      sb..write(color.toHex().toLowerCase())..write(separateSymbol);
    }
    return _removeLastChar(sb);
  }

  String get name {
    if (providerName != null) {
      return providerName!;
    } else {
      final StringBuffer sb = StringBuffer();
      final String className = runtimeType.toString();
      final RegExp pascalCaseWords = RegExp('(?:[A-Z]+|^)[a-z]*');
      pascalCaseWords.allMatches(className).forEach((w) => sb..write(w[0])..write(' '));
      return _removeLastChar(sb);
    }
  }

  String _removeLastChar(StringBuffer sb) => sb.toString().substring(0, sb.length - 1);
}
