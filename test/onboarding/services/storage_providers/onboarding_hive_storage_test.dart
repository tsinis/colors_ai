import 'package:colors_ai/onboarding/services/storage_providers/onboarding_hive_storage.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../data/fakes/fake_hive_box.dart';

void main() => group('$OnboardingHiveStorage', () {
      const bool onboardingDone = false;
      late FakeHiveBox<bool> fakeBox;
      late OnboardingHiveStorage onboardStorage;

      setUp(() {
        fakeBox = FakeHiveBox<bool>.empty();
        onboardStorage = OnboardingHiveStorage(openedBox: fakeBox);
      });

      test('saveNewValue()', () async {
        fakeBox.verifyNoBoxInteractions();
        await onboardStorage.saveNewValue(isFirstRun: onboardingDone);
        final Iterable<bool> storedValues = fakeBox.values;
        expect(storedValues.length, 1);
        expect(storedValues.first, onboardingDone);
        fakeBox.verifyNoBoxInteractions(shouldBeEmpty: false);
      });

      test('doMigration() with null old data', () async {
        fakeBox.verifyNoBoxInteractions();
        await onboardStorage.doMigration(null);
        final Iterable<bool> storedValues = fakeBox.values;
        expect(storedValues.isEmpty, true);
        fakeBox.verifyNoBoxInteractions();
      });

      test('doMigration() with non-null old data', () async {
        fakeBox.verifyNoBoxInteractions();
        await onboardStorage.doMigration(onboardingDone);
        final Iterable<bool> storedValues = fakeBox.values;
        expect(storedValues.length, 1);
        expect(storedValues.first, onboardingDone);
        fakeBox.verifyNoBoxInteractions(shouldBeOpen: true, shouldBeEmpty: false);
      });

      test('loadValue on first run', () async {
        fakeBox.verifyNoBoxInteractions();
        final bool isFirstRun = await onboardStorage.loadValue;
        expect(isFirstRun, !onboardingDone);
        fakeBox.verifyNoBoxInteractions();
      });

      test('loadValue after saveNewValue(isFirstRun: $onboardingDone)', () async {
        fakeBox.verifyNoBoxInteractions();
        bool isFirstRun = await onboardStorage.loadValue;
        expect(isFirstRun, !onboardingDone);
        fakeBox.verifyNoBoxInteractions();
        await onboardStorage.saveNewValue(isFirstRun: onboardingDone);
        final Iterable<bool> storedValues = fakeBox.values;
        expect(storedValues.length, 1);
        expect(storedValues.first, isFalse);
        fakeBox.verifyNoBoxInteractions(shouldBeEmpty: false);
        isFirstRun = await onboardStorage.loadValue;
        expect(isFirstRun, onboardingDone);
        fakeBox.verifyNoBoxInteractions(shouldBeEmpty: false);
      });

      test('loadValue from corrupted storage', () async {
        final FakeHiveBox<bool> corruptedBox = FakeHiveBox<bool>.corruptedEmpty();
        final OnboardingHiveStorage corruptedStorage = OnboardingHiveStorage(openedBox: corruptedBox);
        corruptedBox.verifyNoBoxInteractions();
        final bool isFirstRun = await corruptedStorage.loadValue;
        expect(isFirstRun, onboardingDone);
        corruptedBox.verifyNoBoxInteractions();
      });
    });
