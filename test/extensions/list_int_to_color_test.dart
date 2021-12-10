import 'package:flutter_test/flutter_test.dart';

// ignore_for_file: avoid_relative_lib_imports
import '../../lib/core/extensions/constants.dart';
import '../../lib/core/extensions/int_color_extensions.dart';

void main() => group('IntRGBColor extensions tests:', () {
      test('converting IntRGBColor to Color', () async => expect([0, 0, 0].toColor(), kDarkColor.withOpacity(1)));
    });
