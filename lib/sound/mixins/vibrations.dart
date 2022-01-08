import 'package:platform_info/platform_info.dart';
import 'package:vibration/vibration.dart';

mixin Vibrations {
  late final bool _customVibrationsAvailable;

  Future<bool> initVibrations() async {
    if (platform.isMobile) {
      try {
        return _customVibrationsAvailable =
            (await Vibration.hasVibrator() ?? false) && (await Vibration.hasCustomVibrationsSupport() ?? false);
        // ignore: avoid_catches_without_on_clauses
      } catch (_) {
        return _customVibrationsAvailable = false;
      }
    } else {
      return _customVibrationsAvailable = false;
    }
  }

  bool vibrate({int durationInMs = 150}) {
    if (_customVibrationsAvailable) {
      Vibration.vibrate(duration: durationInMs);

      return true;
    }

    return false;
  }
}
