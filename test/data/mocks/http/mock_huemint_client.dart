import 'dart:convert';
import 'dart:ui';

import 'package:colors_ai/color_generator/models/colors/colors_providers/huemint/huemint_colors.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:http/http.dart';

import 'mock_api_client.dart';

class MockHuemintClient extends MockApiClient {
  MockHuemintClient({int statusCodeToReturn = 200}) : super(_handler, statusCode: statusCodeToReturn);

  static Future<Response> _handler(Request request) async {
    final Iterable<String> colors = MockApiClient.generateColors().map(
      (Color color) => colorToHex(
        color,
        toUpperCase: false,
        includeHashSign: true,
        enableAlpha: false,
      ),
    );
    final Map<String, dynamic> palette = <String, dynamic>{
      HuemintColors.paletteKey: colors.toList(growable: false),
      'score': -5.672145843505859,
    };

    final Map<String, List<Map<String, dynamic>>> map = <String, List<Map<String, dynamic>>>{
      HuemintColors.jsonKey: <Map<String, dynamic>>[palette, palette, palette],
    };

    return Response(jsonEncode(map), 200, request: request);
  }
}
