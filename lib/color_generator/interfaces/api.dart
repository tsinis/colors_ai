import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

import '../../core/models/color_palette/color_palette.dart';
import 'colors_from_api.dart';

abstract class API<T> {
  final ColorsFromAPI _colorsFromApi;
  final Map<String, String> _headers;
  final String _host;
  final Duration _timeout;

  const API(
    this._host,
    this._colorsFromApi, {
    Duration timeout = const Duration(seconds: 8),
    Map<String, String> headers = const {'Content-Type': 'application/json'},
  })  : _headers = headers,
        _timeout = timeout;

  @required
  Future<ColorPalette> fetchNewColors(
    ColorPalette palette, {
    List<bool> lockedColors = const [],
    bool forUI = false,
  });

  @protected
  Future<ColorPalette> sendPostRequest(T body) async {
    final Uri? uri = Uri.tryParse(_host);
    if (uri == null) {
      throw Exception('Cannot parse host!');
    }

    final Response response = await post(uri, headers: _headers, body: body).timeout(_timeout);

    if (response.statusCode < 200 || response.statusCode > 299) {
      throw Exception('Network error, status Code: ${response.statusCode}');
    } else {
      return _colorsFromApi.fromResponse(response);
    }
  }
}
