import 'package:flutter_test/flutter_test.dart';

// ignore_for_file: avoid_relative_lib_imports
import '../../lib/extensions/constants.dart';
import '../../lib/extensions/list_int_to_color.dart';

void main() => group('List<int> extensions tests:', () {
      test('converting List<int> to Color', () async => expect([0, 0, 0].toColor(), darkColor.withOpacity(1)));
      test('check List<int> color lightness', () async => expect([0, 0, 0].contrastColor(), lightColor));
    });
