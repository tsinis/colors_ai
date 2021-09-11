import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../core/models/typedef_aliases/int_rgb_color.dart';
import '../../models/colors/colors_json.dart';
import 'constants.dart';
import 'utils.dart';

class API {
  const API();

  Future<http.Response> _colorsFromAPI(
    List<IntRGBColor> existingColors, {
    required List<bool> lockedColors,
    required bool isUiModel,
  }) async {
    final IntRGBColor body;
    if (lockedColors.contains(true)) {
      final String input = startCurlyBracket +
          inputName +
          colorsToInput(existingColors, lockedColors: lockedColors) +
          (isUiModel ? uiModelBody : defaultModelBody) +
          endCurlyBracket;
      body = utf8.encode(input);
    } else {
      body = utf8.encode(isUiModel ? uiModel : defaultModel);
    }

    return http.post(Uri.parse(host), headers: headers, body: body).timeout(const Duration(seconds: 8));
  }

  Future<ColorsAI> getNewColors(
    ColorsAI existingColors, {
    required List<bool> lockedColors,
    bool forUI = false,
  }) async {
    final List<bool> invertedLocks = lockedColors.map((isLocked) => !isLocked).toList();
    final http.Response response =
        await _colorsFromAPI(existingColors.list, isUiModel: forUI, lockedColors: invertedLocks);
    if (response.statusCode < 200 || response.statusCode > 299) {
      throw Exception('Network error, status Code: ${response.statusCode}');
    } else {
      final responseMap = jsonDecode(response.body) as Map<String, dynamic>;

      return ColorsAI.fromJson(responseMap);
    }
  }
}
