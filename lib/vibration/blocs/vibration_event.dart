part of 'vibration_bloc.dart';

@freezed
class VibrationEvent with _$VibrationEvent {
  const factory VibrationEvent.started() = _Started;
  const factory VibrationEvent.vibrated([@Default(150) int durationInMs]) = _Vibrated;
  const factory VibrationEvent.settingsChanged({required bool isEnabled}) = _SettingsChanged;
}
