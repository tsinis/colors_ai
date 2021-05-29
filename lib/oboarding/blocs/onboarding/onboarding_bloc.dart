import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../repository/onboarding_repository.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(const OnboardingInitial());

  static const OnboardingRepository _onboardingRepository = OnboardingRepository();

  @override
  Stream<OnboardingState> mapEventToState(OnboardingEvent event) async* {
    if (event is OnboardingLoadDataStarted) {
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
