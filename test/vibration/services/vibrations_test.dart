import 'package:colors_ai/vibration/services/vibrations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:platform_info/platform_info.dart';

import '../../data/mocks/vibrations_mock.dart';

Future<void> main() async {
  late Vibrations vibrations;

  setUpAll(TestWidgetsFlutterBinding.ensureInitialized);

  VibrationsMock vibrationsMock(FakePlatform testPlatform) {
    if (testPlatform.isMobile) {
      return VibrationsMock(hasCustomVibrationsSupport: true);
    } else if (testPlatform.isDesktop) {
      return VibrationsMock(hasVibrator: false);
    }

    return VibrationsMock();
  }

  Future<VibrationsMock> mockMethodChannel(FakePlatform testPlatform) async {
    final VibrationsMock vibratorMock = vibrationsMock(testPlatform);
    vibrations = await Vibrations.init();

    return vibratorMock;
  }

  group('$Vibrations should', () {
    test(
      'vibrate on mobiles with initVibrations() and then vibrate()',
      () async {
        final VibrationsMock vibrator = await mockMethodChannel(FakePlatform(operatingSystem: OperatingSystem.iOS));
        expect(vibrations.hasCustomVibrationsSupport, isTrue);
        expect(vibrator.timesVibrated, isZero);
        vibrations.vibrate();
        expect(vibrator.timesVibrated, 1);
      },
    );

    test(
      'not vibrate on desktop platform with initVibrations() and then vibrate()',
      () async {
        final VibrationsMock vibrator = await mockMethodChannel(FakePlatform(operatingSystem: OperatingSystem.macOS));
        expect(vibrations.hasCustomVibrationsSupport, isFalse);
        vibrations.vibrate();
        expect(vibrator.timesVibrated, isZero);
      },
    );

    test(
      'not vibrate on web/unknown platform with initVibrations() and then vibrate()',
      () async {
        final VibrationsMock vibrator = await mockMethodChannel(FakePlatform(operatingSystem: OperatingSystem.unknown));
        expect(vibrations.hasCustomVibrationsSupport, isFalse);
        vibrations.vibrate();
        expect(vibrator.timesVibrated, isZero);
      },
    );
  });
}
