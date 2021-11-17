import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

import '../models/colors/colors_json.dart';

abstract class API {
  const API(
    this._host, {
    Duration timeout = const Duration(seconds: 8),
    Map<String, String> headers = const {'Content-Type': 'application/json'},
  })  : _headers = headers,
        _timeout = timeout;

  final Map<String, String> _headers;
  final String _host;
  final Duration _timeout;

  @required
  Future<ColorsAI> fetchNewColors(ColorsAI existingColors, {List<bool> lockedColors = const [], bool forUI = false});

  @protected
  Future<Response> sendPostRequest(List<int> body) {
    final Uri? uri = Uri.tryParse(_host);
    if (uri == null) {
      throw Exception('Cannot parse host!');
    }

    return post(uri, headers: _headers, body: body).timeout(_timeout);
  }
}
