import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../services/storage_providers/onboarding_hive_storage.dart';

class OnboardingRepository {
  final OnboardingHiveStorage _storage;

  Future<bool> get loadOnboardData async {
    final Box<bool> onboardBox = await _storage.openBox;
    try {
      final bool? isFirstRun = onboardBox.get(_storage.isFirstRunKey, defaultValue: true);

      return !(isFirstRun == false);
    } on Exception catch (e) {
      debugPrint('Exception during onboarding box opening: $e');

      return true;
    } finally {
      await onboardBox.close();
    }
  }

  const OnboardingRepository(OnboardingHiveStorage storage) : _storage = storage;

  Future<void> onboardingDone() async {
    final Box<bool> storageBox = await _storage.openBox;
    await storageBox.put(_storage.isFirstRunKey, false);
    await storageBox.close();
  }
}
