import 'package:bloc_test/bloc_test.dart';
import 'package:colors_ai/onboarding/blocs/onboarding_bloc.dart';
import 'package:colors_ai/onboarding/repository/onboarding_repository.dart';
import 'package:colors_ai/onboarding/services/storage_providers/onboarding_hive_storage.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../data/fakes/fake_hive_box.dart';

void main() => group('$OnboardingBloc', () {
      late OnboardingRepository onboardingRepository;
      late FakeHiveBox<bool> fakeBox;
      late OnboardingHiveStorage onboardStorage;

      setUp(() {
        fakeBox = FakeHiveBox<bool>.empty();
        onboardStorage = OnboardingHiveStorage(openedBox: fakeBox);
        onboardingRepository = OnboardingRepository(onboardStorage);
      });

      blocTest<OnboardingBloc, void>(
        'on Initial',
        build: () => OnboardingBloc(onboardingRepository),
        expect: () => isEmpty,
      );

      blocTest<OnboardingBloc, OnboardingState>(
        '$OnboardingStarted',
        build: () => OnboardingBloc(onboardingRepository),
        act: (OnboardingBloc bloc) => bloc.add(const OnboardingStarted()),
        expect: () => <TypeMatcher<OnboardingState>>[isA<OnboardingLoadInProgress>(), isA<OnboardingNotFinished>()],
        verify: (OnboardingBloc bloc) => expect(fakeBox.isOpen, false),
      );

      blocTest<OnboardingBloc, OnboardingState>(
        '$OnboardingStarted with corrupted storage',
        build: () {
          final FakeHiveBox<bool> corruptedBox = FakeHiveBox<bool>.corruptedEmpty();
          final OnboardingRepository corruptedRepo = OnboardingRepository(
            OnboardingHiveStorage(openedBox: corruptedBox),
          );

          return OnboardingBloc(corruptedRepo);
        },
        act: (OnboardingBloc bloc) => bloc.add(const OnboardingStarted()),
        expect: () => <TypeMatcher<OnboardingState>>[isA<OnboardingLoadInProgress>(), isA<OnboardingDoneSuccess>()],
        verify: (OnboardingBloc bloc) => expect(fakeBox.isOpen, false),
      );

      blocTest<OnboardingBloc, OnboardingState>(
        '$OnboardingFinished',
        build: () => OnboardingBloc(onboardingRepository),
        act: (OnboardingBloc bloc) => bloc.add(const OnboardingFinished()),
        expect: () => <TypeMatcher<OnboardingState>>[isA<OnboardingDoneSuccess>()],
        verify: (OnboardingBloc bloc) => expect(fakeBox.isOpen, false),
      );
    });
