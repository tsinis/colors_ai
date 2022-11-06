part of 'vibration_bloc.dart';

@freezed
class VibrationState with _$VibrationState {
  const factory VibrationState.initial({required bool canVibrate, required bool isVibrationEnabled}) = _Initial;
  const factory VibrationState.loadInProgress({required bool isVibrationEnabled}) = _LoadInProgress;
}
