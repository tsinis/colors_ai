import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class OnboardingRepository {
  final String boxName;
  final String isFirstRunKey;

  Future<bool> get loadOnboardData async {
    final Box<bool> onboardBox = await _openBox();
    try {
      final bool? isFirstRun = onboardBox.get(isFirstRunKey, defaultValue: true);

      return !(isFirstRun == false);
    } on Exception catch (e) {
      debugPrint('Exception during onboarding box opening: $e');

      return true;
    } finally {
      await onboardBox.close();
    }
  }

  const OnboardingRepository({this.isFirstRunKey = 'firstRun', this.boxName = 'onboard'});

  Future<void> onboardingDone() async {
    final Box<bool> onboard = await _openBox();
    await onboard.put(isFirstRunKey, false);
    await onboard.close();
  }

  Future<Box<bool>> _openBox() async => Hive.openBox<bool>(boxName);
}
