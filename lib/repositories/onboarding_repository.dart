import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class OnboardingRepository {
  const OnboardingRepository();

  static const String _onboardingBox = 'onboard', _isFirstRun = 'firstRun';

  Future<bool> get loadOnboardData async {
    final Box<bool> onboardBox = await Hive.openBox<bool>(_onboardingBox);
    try {
      final bool? isFirstRun = onboardBox.get(_isFirstRun, defaultValue: true);
      return !(isFirstRun == false);
    } on Exception catch (e) {
      debugPrint('Exception during onboarding box opening: $e');
      return true;
    } finally {
      await onboardBox.close();
    }
  }

  Future<void> onboardingDone() async {
    final Box onboard = await Hive.openBox<bool>(_onboardingBox);
    await onboard.put(_isFirstRun, false);
    await onboard.close();
  }
}
