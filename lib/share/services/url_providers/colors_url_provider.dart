import 'dart:ui' show Color;

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../../core/extensions/color_extensions.dart';
import '../../../core/models/color_palette/color_palette.dart';

part 'providers/arts_google.dart';
part 'providers/cohesive_colors.dart';
part 'providers/color_combos.dart';
part 'providers/colordesigner.dart';
part 'providers/colordot.dart';
part 'providers/coolors.dart';
part 'providers/design_ai.dart';
part 'providers/dopely_colors.dart';
part 'providers/huemint.dart';
part 'providers/make_tints_and_shades.dart';
part 'providers/muzli_colors.dart';
part 'providers/palettable.dart';
part 'providers/palette_ninja.dart';
part 'providers/poolors.dart';
part 'providers/sessions_college.dart';

abstract class ColorsUrlProvider with EquatableMixin {
  final String _baseUrl;
  final String? _formats;
  final String? _providerName;
  final String _separateSymbol;

  String? get formats => _formats;

  @visibleForTesting
  String get fullUrl => _fullUrl;

  String get name {
    final String? providerName = _providerName;
    if (providerName != null) {
      return providerName;
    } else {
      final StringBuffer sb = StringBuffer();
      final RegExp pascalCaseWords = RegExp('(?:[A-Z]+|^)[a-z]*');
      pascalCaseWords.allMatches(keyName).forEach((RegExpMatch w) => sb..write('${w[0]} '));

      return _removeLastChar(sb.toString());
    }
  }

  String get keyName => runtimeType.toString();

  @override
  List<String> get props => <String>[keyName];

  String get _fullUrl => 'https://$_baseUrl';

  const ColorsUrlProvider({
    required String baseUrl,
    String? providerName,
    String? formats,
    String separateSymbol = '-',
  })  : _baseUrl = baseUrl,
        _providerName = providerName,
        _formats = formats,
        _separateSymbol = separateSymbol;

  String url(ColorPalette palette) {
    final StringBuffer sb = StringBuffer(_fullUrl);
    for (final Color color in palette.colors) {
      sb.write(color.toHex().toLowerCase() + _separateSymbol);
    }

    return _removeLastChar(sb.toString());
  }

  String _removeLastChar(String name) => name.substring(0, name.length - _separateSymbol.length).trim();
}
