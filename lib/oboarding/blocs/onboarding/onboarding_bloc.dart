import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../repository/onboarding_repository.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final OnboardingRepository _onboardingRepository;

  OnboardingBloc(OnboardingRepository onboardingRepository)
      : _onboardingRepository = onboardingRepository,
        super(const OnboardingInitial());

  @override
  Stream<OnboardingState> mapEventToState(OnboardingEvent event) async* {
    if (event is OnboardingStarted) {
      yield const OnboardingLoadInProgress();
      final bool isFirstRun = await _onboardingRepository.loadOnboardData;
      try {
        yield isFirstRun ? const OnboardingNotFinished() : const OnboardingDoneSuccess();
      } on Exception catch (_) {
        yield const OnboardingDoneSuccess();
      }
    } else if (event is OnboardingFinished) {
      yield const OnboardingDoneSuccess();
      await _onboardingRepository.onboardingDone();
    }
  }
}
