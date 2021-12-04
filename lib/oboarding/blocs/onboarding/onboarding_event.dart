part of 'onboarding_bloc.dart';

abstract class OnboardingEvent extends Equatable {
  @override
  List<Object> get props => [];

  const OnboardingEvent();
}

class OnboardingStarted extends OnboardingEvent {
  const OnboardingStarted();
}

class OnboardingFinished extends OnboardingEvent {
  const OnboardingFinished();
}
