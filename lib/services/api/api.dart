import 'dart:convert';

// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;

import '../../models/colors/colors_json.dart';
import 'constants.dart';
import 'utils.dart';

class API {
  const API();

  Future<http.Response> _colorsFromAPI(List<List<int>> existingColors,
      {required Set<int> lockedColors, required bool isUiModel}) async {
    final List<int> body;
    if (lockedColors.isEmpty) {
      body = utf8.encode(isUiModel ? uiModel : defaultModel);
    } else {
      final String input =
          // ignore: prefer_interpolation_to_compose_strings
          startCurlyBracket +
              inputName +
              colorsToInput(existingColors, lockedColors: lockedColors) +
              (isUiModel ? uiModelBody : defaultModelBody) +
              endCurlyBracket;
      body = utf8.encode(input);
    }
    return await http.post(host, headers: headers, body: body);
  }

  Future<ColorsAI> getNewColors(ColorsAI existingColors,
      {Set<int> lockedColors = colorsAPI, bool forUI = false}) async {
    final Set<int> invertedLocks = {}
      ..addAll(colorsAPI)
      ..removeAll(lockedColors);
    final http.Response response =
        await _colorsFromAPI(existingColors.list, isUiModel: forUI, lockedColors: invertedLocks);
    if (response.statusCode != 200 || response.body == null) {
      // TODO! Handle status codes.
      throw Exception('Error, Status Code: ${response.statusCode}');
    } else {
      final ColorsAI newColors = colorsFromJson(response.body);
      if (lockedColors.isNotEmpty) {
        for (final int lockedIndex in lockedColors) {
          newColors.list[lockedIndex] = existingColors.list[lockedIndex];
        }
      }
      return newColors;
    }
  }
}
