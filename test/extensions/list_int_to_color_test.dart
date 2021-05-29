import 'package:flutter_test/flutter_test.dart';

// ignore_for_file: avoid_relative_lib_imports
import '../../lib/general/extensions/constants.dart';
import '../../lib/general/extensions/list_int_to_color.dart';

void main() => group('IntRGBColor extensions tests:', () {
      test('converting IntRGBColor to Color', () async => expect([0, 0, 0].toColor(), darkColor.withOpacity(1)));
    });
