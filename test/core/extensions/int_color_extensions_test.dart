import 'dart:ui' show Color;

import 'package:colors_ai/core/extensions/int_color_extensions.dart';
import 'package:flutter_test/flutter_test.dart';

void main() => group('IntColorExtensions toColor()', () {
      test('from valid color', () => expect(<int>[4, 3, 2].toColor(), const Color.fromRGBO(4, 3, 2, 1)));
      test('from invalid color', () => expect(<int>[0].toColor(), IntColorExtensions.kFallbackColor));
    });
