import 'package:colors_ai/onboarding/services/storage_providers/onboarding_hive_storage.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../data/fakes/fake_hive_box.dart';
import '../../../utils/fake_box_verify.dart';

void main() => group('$OnboardingHiveStorage', () {
      const bool onboardingDone = false;
      late FakeHiveBox<bool> fakeBox;
      late OnboardingHiveStorage onboardStorage;

      setUp(() {
        fakeBox = FakeHiveBox<bool>.empty();
        onboardStorage = OnboardingHiveStorage(openedBox: fakeBox);
      });

      test('saveNewValue()', () async {
        verifyNoBoxInteractions(fakeBox);
        await onboardStorage.saveNewValue(isFirstRun: onboardingDone);
        final Iterable<bool> storedValues = fakeBox.values;
        expect(storedValues.length, 1);
        expect(storedValues.first, onboardingDone);
        verifyNoBoxInteractions(fakeBox, shouldBeEmpty: false);
      });

      test('loadValue on first run', () async {
        verifyNoBoxInteractions(fakeBox);
        final bool isFirstRun = await onboardStorage.loadValue;
        expect(isFirstRun, !onboardingDone);
        verifyNoBoxInteractions(fakeBox);
      });

      test('loadValue after saveNewValue(isFirstRun: $onboardingDone)', () async {
        verifyNoBoxInteractions(fakeBox);
        bool isFirstRun = await onboardStorage.loadValue;
        expect(isFirstRun, !onboardingDone);
        verifyNoBoxInteractions(fakeBox);
        await onboardStorage.saveNewValue(isFirstRun: onboardingDone);
        final Iterable<bool> storedValues = fakeBox.values;
        expect(storedValues.length, 1);
        expect(storedValues.first, isFalse);
        verifyNoBoxInteractions(fakeBox, shouldBeEmpty: false);
        isFirstRun = await onboardStorage.loadValue;
        expect(isFirstRun, onboardingDone);
        verifyNoBoxInteractions(fakeBox, shouldBeEmpty: false);
      });

      test('loadValue form corrupted storage', () async {
        final FakeHiveBox<bool> corruptedBox = FakeHiveBox<bool>.corruptedEmpty();
        final OnboardingHiveStorage corruptedStorage = OnboardingHiveStorage(openedBox: corruptedBox);
        verifyNoBoxInteractions(corruptedBox);
        final bool isFirstRun = await corruptedStorage.loadValue;
        expect(isFirstRun, !onboardingDone);
        verifyNoBoxInteractions(corruptedBox);
      });
    });
