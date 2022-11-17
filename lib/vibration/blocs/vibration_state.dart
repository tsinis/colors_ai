part of 'vibration_bloc.dart';

@freezed
class VibrationState with _$VibrationState {
  const factory VibrationState.loadInProgress({@Default(true) bool isVibrationEnabled}) = _LoadInProgress;
  // ignore: unnecessary-nullable, to provide default value as a fallback.
  const factory VibrationState.initial({@Default(false) bool? canVibrate, @Default(true) bool isVibrationEnabled}) =
      _Initial;
}
