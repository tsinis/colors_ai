import 'package:colors_ai/core/services/data_storage.dart';
import 'package:colors_ai/onboarding/repository/onboarding_repository.dart';
import 'package:colors_ai/onboarding/services/storage_providers/onboarding_hive_storage.dart';
import 'package:flutter_test/flutter_test.dart';

void main() => group('Onboarding storage:', () {
      const OnboardingRepository onboardingRepo = OnboardingRepository(OnboardingHiveStorage());

      test('save onboarding data as done', () async {
        await const DataStorage().init();
        await onboardingRepo.onboardingDone();

        final bool isFirstRun = await onboardingRepo.loadOnboardData;

        expect(isFirstRun, false);
      });

      test('check if onboarding data exists', () async {
        final bool isFirstRun = await onboardingRepo.loadOnboardData;

        expect(isFirstRun, false);
      });
    });
