import 'package:collection/collection.dart' show IterableEquality;
import 'package:colors_ai/core/extensions/color_extensions.dart';
import 'package:colors_ai/core/extensions/constants.dart';
import 'package:flutter_test/flutter_test.dart';

void main() => group('ColorExtensions', () {
      test(
        'toListInt()',
        () => expect(const IterableEquality<int>().equals(kDarkColor.toListInt(), <int>[0, 0, 0]), true),
      );
      test('toHex()', () => expect(kDarkColor.toHex(), '000000'));
      group('contrastColor()', () {
        test('from Dark Color', () => expect(kDarkColor.contrastColor(), kLightColor));
        test('from Light Color', () => expect(kLightColor.contrastColor(), kDarkColor));
      });
    });
