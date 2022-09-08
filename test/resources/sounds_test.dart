import 'dart:io';

import 'package:colors_ai/resources/sounds.dart';
import 'package:flutter_test/flutter_test.dart';

void main() => test('$Sounds exists', () {
      expect(File(Sounds.notificationHighIntensity).existsSync(), true);
      expect(File(Sounds.notificationSimple02).existsSync(), true);
      expect(File(Sounds.uiLock).existsSync(), true);
      expect(File(Sounds.uiRefreshFeed).existsSync(), true);
    });
