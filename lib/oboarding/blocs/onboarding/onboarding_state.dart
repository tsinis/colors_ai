part of 'onboarding_bloc.dart';

abstract class OnboardingState extends Equatable {
  @override
  List<Object> get props => <Object>[];

  const OnboardingState();
}

class OnboardingInitial extends OnboardingState {
  const OnboardingInitial();
}

class OnboardingLoadInProgress extends OnboardingState {
  const OnboardingLoadInProgress();
}

class OnboardingNotFinished extends OnboardingState {
  const OnboardingNotFinished();
}

class OnboardingDoneSuccess extends OnboardingState {
  const OnboardingDoneSuccess();
}
