import 'dart:convert';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

import '../../core/models/color_palette/color_palette.dart';
import 'colors_from_api.dart';

abstract class API<T extends Object> {
  final String generateModelKey;
  final String paletteInputKey;

  final String unlockedColorChar;
  final ColorsFromAPI _apiColors;
  final Map<String, String> _headers;
  final String _host;
  final Duration _timeout;

  const API(
    this._host,
    this._apiColors, {
    required this.unlockedColorChar,
    required this.generateModelKey,
    required this.paletteInputKey,
    Duration timeout = const Duration(seconds: 8),
    Map<String, String> headers = const <String, String>{'Content-Type': 'application/json'},
  })  : _headers = headers,
        _timeout = timeout;

  @required
  T apiColorTransformer(Color color);

  @required
  Future<ColorPalette> fetchNewColors(ColorPalette palette, List<bool> lockedColors);

  @protected
  MapEntry<String, List<Object>> colorsToInput(ColorPalette palette, List<bool> lockedColors) {
    final List<Object> paletteToInput = List<Object>.of(<Object>[]);
    palette.colors.asMap().forEach((int colorIndex, Color color) {
      final bool isLocked = lockedColors[colorIndex];
      paletteToInput.add(isLocked ? unlockedColorChar : apiColorTransformer(color));
    });

    return MapEntry<String, List<Object>>(paletteInputKey, paletteToInput);
  }

  @protected
  MapEntry<String, String> modelToInput(String modelValue) => MapEntry<String, String>(generateModelKey, modelValue);

  @protected
  Future<ColorPalette> sendPostRequest(Object body) async {
    final Uri? uri = Uri.tryParse(_host);
    if (uri == null) {
      throw Exception('Cannot parse host!');
    }
    final String payload = jsonEncode(body);
    debugPrint('REQUEST PAYLOAD $payload');
    final Response response = await post(uri, headers: _headers, body: payload).timeout(_timeout);

    if (response.statusCode < 200 || response.statusCode > 299) {
      throw Exception('Network error, status Code: ${response.statusCode}');
    } else {
      return _apiColors.fromResponse(response);
    }
  }
}
