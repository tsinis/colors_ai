part of 'vibration_bloc.dart';

@freezed
class VibrationState with _$VibrationState {
  const factory VibrationState.loadInProgress({@Default(true) bool isVibrationEnabled}) = _LoadInProgress;
  const factory VibrationState.initial({@Default(false) bool canVibrate, @Default(true) bool isVibrationEnabled}) =
      _Initial;
}
