import 'package:flutter_test/flutter_test.dart';

// ignore_for_file: avoid_relative_lib_imports
import '../../lib/core/extensions/color_extensions.dart';
import '../../lib/core/extensions/constants.dart';

void main() => group('Color extensions tests:', () {
      test('converting Color to hex String', () async => expect(kDarkColor.toHex(), '000000'));
      test('check color lightness', () async => expect(kDarkColor.contrastColor(), kLightColor));
    });
