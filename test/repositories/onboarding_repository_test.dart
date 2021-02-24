import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

// ignore_for_file: avoid_relative_lib_imports
import '../../lib/repositories/onboarding_repository.dart';

void main() => group('Onboarding storage:', () {
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
