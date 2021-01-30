part of 'onboarding_bloc.dart';

abstract class OnboardingEvent extends Equatable {
  const OnboardingEvent();

  @override
  List<Object> get props => [];
}

class OnboardingLoadDataStarted extends OnboardingEvent {
  const OnboardingLoadDataStarted();
}

class OnboardingFinished extends OnboardingEvent {
  const OnboardingFinished();
}
