import 'package:vibration/vibration.dart';

class Vibrations {
  late final bool _customVibrationsAvailable;

  Future<bool> init() async {
    try {
      final bool hasBasicVibrator = await Vibration.hasVibrator() ?? false;
      final bool hasExtenderVibrator = await Vibration.hasCustomVibrationsSupport() ?? false;

      return _customVibrationsAvailable = hasBasicVibrator && hasExtenderVibrator;
      // ignore: avoid_catches_without_on_clauses
    } catch (_) {
      return _customVibrationsAvailable = false;
    }
  }

  bool vibrate({int durationInMs = 150}) {
    if (_customVibrationsAvailable) {
      Vibration.vibrate(duration: durationInMs);
    }

    return _customVibrationsAvailable;
  }
}
