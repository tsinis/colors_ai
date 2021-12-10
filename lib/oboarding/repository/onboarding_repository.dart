import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class OnboardingRepository {
  final String _boxName;
  final String _isFirstRunKey;

  const OnboardingRepository({String isFirstRunKey = 'firstRun', String boxName = 'onboard'})
      : _isFirstRunKey = isFirstRunKey,
        _boxName = boxName;

  Future<bool> get loadOnboardData async {
    final Box<bool> onboardBox = await _openBox();
    try {
      final bool? isFirstRun = onboardBox.get(_isFirstRunKey, defaultValue: true);

      return !(isFirstRun == false);
    } on Exception catch (e) {
      debugPrint('Exception during onboarding box opening: $e');

      return true;
    } finally {
      await onboardBox.close();
    }
  }

  Future<Box<bool>> _openBox() async => Hive.openBox<bool>(_boxName);

  Future<void> onboardingDone() async {
    final Box<bool> onboard = await _openBox();
    await onboard.put(_isFirstRunKey, false);
    await onboard.close();
  }
}
