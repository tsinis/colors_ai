import 'dart:convert';

import 'package:colors_ai/color_generator/models/colors/colors_providers/colormind/colormind_colors.dart';
import 'package:colors_ai/color_generator/models/colors/colors_providers/colormind/colormind_colors_converter.dart';
import 'package:colors_ai/core/models/typedef_aliases/int_rgb_color.dart';
import 'package:http/http.dart';

import 'mock_api_client.dart';

class MockColormindClient extends MockApiClient {
  MockColormindClient({int statusCodeToReturn = 200}) : super(_handler, statusCode: statusCodeToReturn);

  static Future<Response> _handler(Request request) async {
    final List<IntRGBColor> colors = const ColormindColorsConverter().toJson(MockApiClient.generateColors());
    final Map<String, List<IntRGBColor>> map = <String, List<IntRGBColor>>{
      ColormindColors.jsonKey: colors.toList(growable: false),
    };

    return Response(jsonEncode(map), 200, request: request);
  }
}
