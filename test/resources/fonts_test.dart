import 'dart:io';

import 'package:colors_ai/resources/fonts.dart';
import 'package:flutter_test/flutter_test.dart';

void main() => test('$Fonts exists', () {
      expect(File(Fonts.robotoRegular).existsSync(), true);
      expect(File(Fonts.robotoMonoRegular).existsSync(), true);
    });
