import 'package:platform_info/platform_info.dart';
import 'package:vibration/vibration.dart';

mixin Vibrations {
  late final bool _customVibrationsAvailable;

  Future<void> initVibrations() async {
    if (platform.isMobile) {
      _customVibrationsAvailable =
          (await Vibration.hasVibrator() ?? false) && (await Vibration.hasCustomVibrationsSupport() ?? false);
    } else {
      _customVibrationsAvailable = false;
    }
  }

  void vibrate({int durationInMs = 150}) {
    if (_customVibrationsAvailable) {
      Vibration.vibrate(duration: durationInMs);
    }
  }
}
