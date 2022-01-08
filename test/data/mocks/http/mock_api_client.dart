import 'dart:math' show Random;
import 'dart:ui' show Color;

import 'package:colors_ai/color_generator/interfaces/api.dart';
import 'package:colors_ai/color_generator/models/colors/constants.dart';
import 'package:colors_ai/core/extensions/int_color_extensions.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

abstract class MockApiClient extends MockClient {
  MockApiClient(MockClientHandler handler, {required int statusCode})
      : super((API.isErrorStatusCode(statusCode)) ? _handlerWithError : handler);

  @visibleForTesting
  List<bool> generateLocks({int? lockedCount, int? overallLength}) {
    final int lockedLength = lockedCount ?? 1;
    final int unlockedLength = (overallLength ?? kDefaultColors.length) - lockedLength;
    final List<bool> locked = List<bool>.filled(lockedLength, true, growable: true);
    final List<bool> unLocked = List<bool>.filled(unlockedLength, false);
    locked.addAll(unLocked);

    return locked;
  }

  static List<Color> generateColors({int? length}) =>
      List<Color>.generate(length ?? kDefaultColors.length, _randomRgbColor, growable: false);

  static Color _randomRgbColor(int modifier) {
    int randomChannelColor() => Random().nextInt((255 - modifier).clamp(0, 255));

    final int red = randomChannelColor();
    final int blue = randomChannelColor();
    final int green = randomChannelColor();

    return <int>[red, blue, green].toColor();
  }

  static Future<Response> _handlerWithError(Request request) async => Response('Server error.', 404, request: request);
}
