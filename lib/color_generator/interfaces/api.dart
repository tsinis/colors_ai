import 'dart:convert';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

import '../../core/models/color_palette/color_palette.dart';
import 'colors_from_api.dart';

abstract class API<T extends Object> {
  final String _generateModelKey;
  final String _paletteInputKey;
  final String _unlockedColorChar;
  final ColorsFromAPI _apiColors;
  final Map<String, String> _headers;
  final String _host;
  final Client? _httpClient;
  final Duration _timeout;

  const API(
    this._host,
    this._apiColors, {
    required String unlockedColorChar,
    required String generateModelKey,
    required String paletteInputKey,
    Duration timeout = const Duration(seconds: 8),
    Map<String, String> headers = const <String, String>{'Content-Type': 'application/json'},
    Client? httpClient,
  })  : _unlockedColorChar = unlockedColorChar,
        _generateModelKey = generateModelKey,
        _paletteInputKey = paletteInputKey,
        _headers = headers,
        _httpClient = httpClient,
        _timeout = timeout;

  @visibleForTesting
  T apiColorTransformer(Color color);

  @required
  Future<ColorPalette> fetchNewColors(ColorPalette palette, List<bool> lockedColors);

  MapEntry<String, List<Object>> colorsToInput(ColorPalette palette, List<bool> lockedColors) {
    final List<Object> paletteToInput = List<Object>.of(<Object>[]);
    palette.colors.asMap().forEach((int colorIndex, Color color) {
      final bool isLocked = lockedColors[colorIndex];
      paletteToInput.add(isLocked ? _unlockedColorChar : apiColorTransformer(color));
    });

    return MapEntry<String, List<Object>>(_paletteInputKey, paletteToInput);
  }

  MapEntry<String, String> modelToInput(String modelValue) => MapEntry<String, String>(_generateModelKey, modelValue);

  @protected
  Future<ColorPalette> sendPostRequest(Object body) async {
    final Uri? uri = Uri.tryParse(_host);
    if (uri == null) {
      throw const FormatException('Cannot parse host.');
    }
    final String payload = jsonEncode(body);
    final Client httpClient = _httpClient ?? Client();
    final Response response = await httpClient.post(uri, headers: _headers, body: payload).timeout(_timeout);

    if (isErrorStatusCode(response.statusCode)) {
      throw Exception('Network error, status Code: ${response.statusCode}.');
    }

    return _apiColors.fromResponse(response);
  }

  @visibleForTesting
  static bool isErrorStatusCode(int statusCode) => statusCode < 200 || statusCode > 299;
}
