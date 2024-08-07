import 'dart:ui' show Color;

import '../../../core/extensions/color.dart';
import '../../../core/models/color_palette/color_palette.dart';

part 'providers/art_google.dart';
part 'providers/design_ai.dart';
part 'providers/colordesigner.dart';
part 'providers/colordot.dart';
part 'providers/coolors.dart';
part 'providers/color_combos.dart';
part 'providers/cohesive_colors.dart';
part 'providers/muzli_colors.dart';
part 'providers/palettable.dart';
part 'providers/poolors.dart';
part 'providers/make_tints_and_shades.dart';
part 'providers/palette_ninja.dart';
part 'providers/sessions_college.dart';

abstract class ColorsUrlProvider {
  const ColorsUrlProvider({
    required this.baseUrl,
    this.providerName,
    this.formats,
    this.separateSymbol = '-',
  });

  final String? providerName, formats;
  final String baseUrl, separateSymbol;

  String get _fullUrl => 'https://$baseUrl';

  String url(ColorPalette palette) {
    final StringBuffer sb = StringBuffer(_fullUrl);
    for (final Color color in palette.colors) {
      sb.write(color.toHex().toLowerCase() + separateSymbol);
    }
    return _removeLastChar(sb.toString());
  }

  String get name {
    if (providerName != null) {
      return providerName!;
    } else {
      final StringBuffer sb = StringBuffer();
      final String className = runtimeType.toString();
      final RegExp pascalCaseWords = RegExp('(?:[A-Z]+|^)[a-z]*');
      pascalCaseWords.allMatches(className).forEach((w) => sb..write('${w[0]} '));
      return _removeLastChar(sb.toString());
    }
  }

  String _removeLastChar(String name) => name.substring(0, name.length - separateSymbol.length);
}
