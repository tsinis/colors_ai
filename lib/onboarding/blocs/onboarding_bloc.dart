import 'dart:async';

import 'package:stream_bloc/stream_bloc.dart';

import '../repository/onboarding_repository.dart';
import 'onboarding_event.dart';
import 'onboarding_state.dart';

export 'onboarding_event.dart';
export 'onboarding_state.dart';

class OnboardingBloc extends StreamBloc<OnboardingEvent, OnboardingState> {
  final OnboardingRepository _onboardingRepository;

  OnboardingBloc(this._onboardingRepository) : super(const OnboardingState.initial());

  @override
  Stream<OnboardingState> mapEventToStates(OnboardingEvent event) => event.when(
        started: () async* {
          yield const OnboardingState.loading();
          final bool isFirstRun = await _onboardingRepository.loadOnboardData;
          yield isFirstRun ? const OnboardingState.notFinished() : const OnboardingState.doneSuccess();
        },
        finished: () async* {
          yield const OnboardingState.doneSuccess();
          await _onboardingRepository.onboardingDone();
        },
      );
}
