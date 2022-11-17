import 'package:colors_ai/onboarding/repository/onboarding_repository.dart';
import 'package:colors_ai/onboarding/services/storage_providers/onboarding_hive_storage.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../data/fakes/fake_hive_box.dart';

void main() => group('$OnboardingRepository', () {
      const bool onboardingDone = false;
      late OnboardingRepository onboardingRepository;
      late FakeHiveBox<bool> fakeBox;
      late OnboardingHiveStorage onboardStorage;

      setUp(() {
        fakeBox = FakeHiveBox<bool>.empty();
        onboardStorage = OnboardingHiveStorage(openedBox: fakeBox);
        onboardingRepository = OnboardingRepository(onboardStorage);
      });

      test('onboardingDone()', () async {
        fakeBox.verifyNoBoxInteractions();
        await onboardingRepository.onboardingDone();
        final Iterable<bool> storedValues = fakeBox.values;
        expect(storedValues.length, 1);
        expect(storedValues.first, onboardingDone);
        fakeBox.verifyNoBoxInteractions(shouldBeEmpty: false);
      });

      test('loadOnboardData on first run', () async {
        fakeBox.verifyNoBoxInteractions();
        final bool isFirstRun = await onboardingRepository.loadOnboardData;
        expect(isFirstRun, !onboardingDone);
        fakeBox.verifyNoBoxInteractions();
      });

      test('loadOnboardData after onboardingDone()', () async {
        fakeBox.verifyNoBoxInteractions();
        bool isFirstRun = await onboardingRepository.loadOnboardData;
        expect(isFirstRun, !onboardingDone);
        fakeBox.verifyNoBoxInteractions();
        await onboardingRepository.onboardingDone();
        final Iterable<bool> storedValues = fakeBox.values;
        expect(storedValues.length, 1);
        expect(storedValues.first, onboardingDone);
        fakeBox.verifyNoBoxInteractions(shouldBeEmpty: false);
        isFirstRun = await onboardingRepository.loadOnboardData;
        expect(isFirstRun, onboardingDone);
        fakeBox.verifyNoBoxInteractions(shouldBeEmpty: false);
      });

      test('loadOnboardData from corrupted storage', () async {
        final FakeHiveBox<bool> corruptedBox = FakeHiveBox<bool>.corruptedEmpty();
        final OnboardingRepository corruptedRepo = OnboardingRepository(
          OnboardingHiveStorage(openedBox: corruptedBox),
        );
        corruptedBox.verifyNoBoxInteractions();
        final bool isFirstRun = await corruptedRepo.loadOnboardData;
        expect(isFirstRun, onboardingDone);
        corruptedBox.verifyNoBoxInteractions();
      });
    });
