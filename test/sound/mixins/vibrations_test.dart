import 'package:colors_ai/sound/mixins/vibrations.dart';
import 'package:flutter_test/flutter_test.dart';

class _VibrationsTest with Vibrations {}

void main() => group('$Vibrations', () {
      final _VibrationsTest vibrations = _VibrationsTest();
      test('initVibrations()', () async => expect(await vibrations.initVibrations(), false));
      test('vibrate()', () => expect(vibrations.vibrate(), false));
    });
