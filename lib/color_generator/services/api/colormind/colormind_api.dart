import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' show Response;

import '../../../../core/models/typedef_aliases/int_rgb_color.dart';
import '../../../interfaces/api.dart';
import '../../../models/colors/colors_ai.dart';
import 'constants.dart';

class ColormindAPI extends API {
  const ColormindAPI() : super('http://colormind.io/api/');

  @override
  Future<ColorsAI> fetchNewColors(
    ColorsAI existingColors, {
    List<bool> lockedColors = const [],
    bool forUI = false,
  }) async {
    final List<bool> invertedLocks = lockedColors.map((isLocked) => !isLocked).toList(growable: false);
    final Response response = await _colorsFromAPI(existingColors.list, isUiModel: forUI, lockedColors: invertedLocks);
    if (response.statusCode < 200 || response.statusCode > 299) {
      throw Exception('Network error, status Code: ${response.statusCode}');
    } else {
      final responseMap = jsonDecode(response.body) as Map<String, dynamic>;

      return ColorsAI.fromJson(responseMap);
    }
  }

  Future<Response> _colorsFromAPI(
    List<IntRGBColor> existingColors, {
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

  @visibleForTesting
  String colorsToInput(List<IntRGBColor> colorslist, {required List<bool> lockedColors}) {
    final StringBuffer sb = StringBuffer(kStartSquareBracket);
    for (final IntRGBColor color in colorslist) {
      final int colorIndex = colorslist.indexOf(color);
      if (lockedColors[colorIndex]) {
        sb.write(kUnlockedColor);
      } else {
        sb.write(color);
      }
      if (colorIndex != colorslist.length - 1) {
        sb.write(kComma);
      }
    }

    sb.write(kEndSquareBracket + kComma);

    return sb.toString().replaceAll(' ', '');
  }
}
