import '../../core/constants.dart';

part 'onboarding_state.freezed.dart';

@freezedWithoutJson
class OnboardingState with _$OnboardingState {
  const factory OnboardingState.initial() = _OnboardingInitial;
  const factory OnboardingState.loading() = _OnboardingLoading;
  const factory OnboardingState.notFinished() = _OnboardingNotFinished;
  const factory OnboardingState.doneSuccess() = _OnboardingDoneSuccess;
}
