import 'package:colors_ai/onboarding/blocs/onboarding_bloc.dart';
import 'package:colors_ai/onboarding/repository/onboarding_repository.dart';
import 'package:colors_ai/onboarding/services/storage_providers/onboarding_hive_storage.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../data/fakes/fake_hive_box.dart';
import '../../data/helpers/test_stream_bloc.dart';

void main() => group('$OnboardingBloc', () {
      late OnboardingRepository onboardingRepository;
      late FakeHiveBox<bool> fakeBox;
      late OnboardingHiveStorage onboardStorage;

      setUp(() {
        fakeBox = FakeHiveBox<bool>.empty();
        onboardStorage = OnboardingHiveStorage(openedBox: fakeBox);
        onboardingRepository = OnboardingRepository(onboardStorage);
      });

      streamBlocTest<OnboardingBloc, void>(
        'on Initial',
        build: () => OnboardingBloc(onboardingRepository),
        expect: () => isEmpty,
      );

      streamBlocTest<OnboardingBloc, OnboardingState>(
        '$OnboardingEvent.started',
        build: () => OnboardingBloc(onboardingRepository),
        act: (OnboardingBloc bloc) => bloc.add(const OnboardingEvent.started()),
        expect: () => <OnboardingState>[const OnboardingState.loading(), const OnboardingState.notFinished()],
        verify: (OnboardingBloc bloc) => expect(fakeBox.isOpen, false),
      );

      streamBlocTest<OnboardingBloc, OnboardingState>(
        '$OnboardingEvent.started with corrupted storage',
        build: () {
          final FakeHiveBox<bool> corruptedBox = FakeHiveBox<bool>.corruptedEmpty();
          final OnboardingRepository corruptedRepo = OnboardingRepository(
            OnboardingHiveStorage(openedBox: corruptedBox),
          );

          return OnboardingBloc(corruptedRepo);
        },
        act: (OnboardingBloc bloc) => bloc.add(const OnboardingEvent.started()),
        expect: () => <OnboardingState>[const OnboardingState.loading(), const OnboardingState.doneSuccess()],
        verify: (OnboardingBloc bloc) => expect(fakeBox.isOpen, false),
      );

      streamBlocTest<OnboardingBloc, OnboardingState>(
        '$OnboardingEvent.finished',
        build: () => OnboardingBloc(onboardingRepository),
        act: (OnboardingBloc bloc) => bloc.add(const OnboardingEvent.finished()),
        expect: () => <OnboardingState>[const OnboardingState.doneSuccess()],
        verify: (OnboardingBloc bloc) => expect(fakeBox.isOpen, false),
      );
    });
