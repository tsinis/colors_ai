import 'dart:convert';
import 'dart:ui';

import 'package:flutter/foundation.dart';

import '../../../../core/extensions/color_extensions.dart';
import '../../../../core/models/color_palette/color_palette.dart';
import '../../../../core/models/typedef_aliases/int_rgb_color.dart';
import '../../../interfaces/api.dart';
import '../../../models/colors/colors_providers/colormind/colormind_colors.dart';
import 'constants.dart';

class ColormindAPI extends API<IntRGBColor> {
  const ColormindAPI() : super('http://colormind.io/api/', const ColormindColors());

  @override
  Future<ColorPalette> fetchNewColors(
    ColorPalette palette, {
    List<bool> lockedColors = const [],
    bool forUI = false,
  }) async {
    final List<bool> invertedLocks = lockedColors.map((isLocked) => !isLocked).toList(growable: false);

    return _colorsFromAPI(palette.colors, isUiModel: forUI, lockedColors: invertedLocks);
  }

  @visibleForTesting
  String colorsToInput(List<Color> colorslist, {required List<bool> lockedColors}) {
    final StringBuffer sb = StringBuffer(kStartSquareBracket);
    for (final Color color in colorslist) {
      final int colorIndex = colorslist.indexOf(color);
      if (lockedColors[colorIndex]) {
        sb.write(kUnlockedColor);
      } else {
        sb.write(color.toListInt());
      }
      if (colorIndex != colorslist.length - 1) {
        sb.write(kComma);
      }
    }

    sb.write(kEndSquareBracket + kComma);

    return sb.toString().replaceAll(' ', '');
  }

  Future<ColorPalette> _colorsFromAPI(
    List<Color> existingColors, {
    required List<bool> lockedColors,
    required bool isUiModel,
  }) async {
    final IntRGBColor body;

    if (lockedColors.contains(true)) {
      final String input = kStartCurlyBracket +
          kInputName +
          colorsToInput(existingColors, lockedColors: lockedColors) +
          (isUiModel ? kUiModelBody : kDefaultModelBody) +
          kEndCurlyBracket;

      body = utf8.encode(input);
    } else {
      body = utf8.encode(isUiModel ? kUiModel : kDefaultModel);
    }

    return sendPostRequest(body);
  }
}
