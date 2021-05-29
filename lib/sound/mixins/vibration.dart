import 'package:vibration/vibration.dart';

mixin Vibrations {
  late final bool customVibrationsAvailible;
  Future<void> init() async => customVibrationsAvailible =
      (await Vibration.hasVibrator() == true) && (await Vibration.hasCustomVibrationsSupport() == true);

  void vibrate() {
    if (customVibrationsAvailible) {
      Vibration.vibrate(duration: 150);
    }
  }
}
