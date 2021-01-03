import 'dart:convert';

// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;

import '../../models/colors/colors_json.dart';
import 'constants.dart';

class API {
  const API();

  String _colorsToString(List<List<int>> colorslist, {required Set<int> lockedColors}) {
    final StringBuffer sb = StringBuffer();
    // ignore: cascade_invocations
    sb.write(startSquareBracket);
    for (final List<int> color in colorslist) {
      final int colorIndex = colorslist.indexOf(color);
      if (lockedColors.contains(colorIndex)) {
        sb.write(unlockedColor);
      } else {
        sb.write(color);
      }
      if (colorIndex != colorslist.length - 1) {
        sb.write(comma);
      }
    }

    sb.write(endSquareBracket + comma);
    return sb.toString().replaceAll(' ', '');
  }

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
              _colorsToString(existingColors, lockedColors: lockedColors) +
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
