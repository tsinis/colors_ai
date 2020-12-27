import 'dart:convert';
// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;

import 'constants.dart';
import 'endpoint_models.dart';

// ignore: avoid_classes_with_only_static_members
class API {
  static Future<http.Response> _result() async => await http.post(host + api, headers: headers, body: Endpoint.model);

  static Future<void> postRequest() async {
    final http.Response res = await _result();
    if (res.statusCode != 200 || res.body == null) {
      // TODO! Handle status codes.
      throw Exception('Error, Status Code: ${res.statusCode}');
    } else {
      final dynamic responseList = _fromJson(json.decode(res.body));
      // ignore: avoid_print
      print(responseList);
    }
  }

  static dynamic _fromJson(dynamic json) {
    if (json is Map<String, dynamic> && json[jsonKey] != null) {
      if (json[jsonKey] is List<dynamic>) {
        return json[jsonKey];
      }
    }
    return;
  }
}
