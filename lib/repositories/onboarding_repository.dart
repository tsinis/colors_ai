import 'package:hive/hive.dart';

class OnboardingRepository {
  const OnboardingRepository();

  static const String _onboardingBox = 'onboard', _isFirstRun = 'firstRun';

  Future<bool> get loadOnboardData async {
    final Box onboard = await Hive.openBox<bool>(_onboardingBox);
    final dynamic isFirstRun = await onboard.get(_isFirstRun);
    await onboard.close();
    if (isFirstRun is bool) {
      return isFirstRun;
    } else {
      return true;
    }
  }

  Future<void> get onboardingDone async {
    final Box onboard = await Hive.openBox<bool>(_onboardingBox);
    await onboard.put(_isFirstRun, false);
    await onboard.close();
  }
}
