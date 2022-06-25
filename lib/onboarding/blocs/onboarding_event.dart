import '../../core/constants.dart';

part 'onboarding_event.freezed.dart';

@freezedWithoutJson
class OnboardingEvent with _$OnboardingEvent {
  const factory OnboardingEvent.finished() = _OnboardingFinished;
  const factory OnboardingEvent.started() = _OnboardingStarted;
}
