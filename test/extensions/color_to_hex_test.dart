import 'package:flutter_test/flutter_test.dart';

// ignore_for_file: avoid_relative_lib_imports
import '../../lib/general/extensions/color.dart';
import '../../lib/general/extensions/constants.dart';

void main() => group('Color extensions tests:', () {
      test('converting Color to hex String', () async => expect(darkColor.toHex(), '000000'));
      test('check color lightness', () async => expect(darkColor.contrastColor(), lightColor));
    });
