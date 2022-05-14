import 'package:colors_ai/sound/mixins/vibrations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:platform_info/platform_info.dart';

import '../../data/mocks/vibrations_mock.dart';

Future<void> main() async {
  late Vibrations vibrations;

  VibrationsMock vibrationsMock(FakePlatform testPlatform) {
    if (testPlatform.isMobile) {
      return const VibrationsMock(hasCustomVibrationsSupport: true);
    } else if (testPlatform.isDesktop) {
      return const VibrationsMock(hasVibrator: false);
    }

    return const VibrationsMock();
  }

  group('$Vibrations should', () {
    setUpAll(TestWidgetsFlutterBinding.ensureInitialized);
    setUp(() => vibrations = Vibrations());
    test(
      'vibrate on mobiles with initVibrations() and then vibrate()',
      () async {
        final FakePlatform testPlatform = FakePlatform(operatingSystem: OperatingSystem.iOS);
        final bool shouldVibrate = testPlatform.isMobile;
        final VibrationsMock vibratorMock = vibrationsMock(testPlatform);
        VibrationsMock.channel.setMockMethodCallHandler(vibratorMock.handleMethodCall);
        expect(await vibrations.init(), shouldVibrate);
        expect(vibrations.vibrate(), shouldVibrate);
      },
    );

    test(
      'not vibrate on desktop platform with initVibrations() and then vibrate()',
      () async {
        final FakePlatform testPlatform = FakePlatform(operatingSystem: OperatingSystem.macOS);
        final bool shouldVibrate = testPlatform.isMobile;
        final VibrationsMock vibratorMock = vibrationsMock(testPlatform);
        VibrationsMock.channel.setMockMethodCallHandler(vibratorMock.handleMethodCall);
        expect(await vibrations.init(), shouldVibrate);
        expect(vibrations.vibrate(), shouldVibrate);
      },
    );

    test(
      'not vibrate on web/unknown platform with initVibrations() and then vibrate()',
      () async {
        final FakePlatform testPlatform = FakePlatform(operatingSystem: OperatingSystem.unknown);
        final bool shouldVibrate = testPlatform.isMobile;
        final VibrationsMock vibratorMock = vibrationsMock(testPlatform);
        VibrationsMock.channel.setMockMethodCallHandler(vibratorMock.handleMethodCall);
        expect(await vibrations.init(), shouldVibrate);
        expect(vibrations.vibrate(), shouldVibrate);
      },
    );
  });
}
