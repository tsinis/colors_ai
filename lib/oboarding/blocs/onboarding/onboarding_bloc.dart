import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../repository/onboarding_repository.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc({this.onboardingRepository = const OnboardingRepository()}) : super(const OnboardingInitial());

  final OnboardingRepository onboardingRepository;

  @override
  Stream<OnboardingState> mapEventToState(OnboardingEvent event) async* {
    if (event is OnboardingStarted) {
      yield const OnboardingLoadInProgress();
      final bool isFirstRun = await onboardingRepository.loadOnboardData;
      try {
        yield isFirstRun ? const OnboardingNotFinished() : const OnboardingDoneSuccess();
      } on Exception catch (_) {
        yield const OnboardingDoneSuccess();
      }
    } else if (event is OnboardingFinished) {
      yield const OnboardingDoneSuccess();
      await onboardingRepository.onboardingDone();
    }
  }
}
