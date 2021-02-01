import 'package:colors_ai/repositories/onboarding_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:hive_flutter/hive_flutter.dart';

void main() {
  group('onboarding storage:', () {
    const OnboardingRepository onboardingRepo = OnboardingRepository();

    test('save onboarding data as done', () async {
      await Hive.initFlutter();
      await onboardingRepo.onboardingDone;

      final bool isFirstRun = await onboardingRepo.loadOnboardData;

      expect(isFirstRun, false);
    });

    test('check if onboarding data exists', () async {
      final bool isFirstRun = await onboardingRepo.loadOnboardData;

      expect(isFirstRun, false);
    });
  });
}
