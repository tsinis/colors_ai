// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;

import '../json/colors_json.dart';
import 'constants.dart';
import 'endpoint_models.dart';

// ignore: avoid_classes_with_only_static_members
class API {
  const API();
  Future<http.Response> get _result async => await http.post(host + api, headers: headers, body: Endpoint.model);

  Future<List<List<int>>> get postRequest async {
    final http.Response response = await _result;
    if (response.statusCode != 200 || response.body == null) {
      // TODO! Handle status codes.
      throw Exception('Error, Status Code: ${response.statusCode}');
    } else {
      final ColorsJSON json = colorsFromJson(response.body);
      return json.result;
    }
  }
}
