import 'package:platform_info/platform_info.dart';
import 'package:vibration/vibration.dart';

mixin Vibrations {
  late final bool customVibrationsAvailible;

  Future<void> initVibrations() async {
    if (platform.isMobile) {
      customVibrationsAvailible =
          (await Vibration.hasVibrator() ?? false) && (await Vibration.hasCustomVibrationsSupport() ?? false);
    } else {
      customVibrationsAvailible = false;
    }
  }

  void vibrate() {
    if (customVibrationsAvailible) {
      Vibration.vibrate(duration: 150);
    }
  }
}
