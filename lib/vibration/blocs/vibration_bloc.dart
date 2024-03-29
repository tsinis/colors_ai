import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../services/vibrations.dart';

part 'vibration_bloc.freezed.dart';
part 'vibration_event.dart';
part 'vibration_state.dart';

class VibrationBloc extends HydratedBloc<VibrationEvent, VibrationState> {
  final Vibrations _vibrationService;
  final String _vibrationsKey;

  VibrationBloc(this._vibrationService, {String vibrationsKey = 'vibrationsEnabled'})
      : _vibrationsKey = vibrationsKey,
        super(const _Initial()) {
    on<VibrationEvent>(_onEvent);
  }

  @override
  VibrationState? fromJson(Map<String, dynamic> json) {
    final bool? isVibrationEnabled = json[_vibrationsKey] as bool?;
    if (isVibrationEnabled != null) {
      return _Initial(
        canVibrate: _vibrationService.hasCustomVibrationsSupport,
        isVibrationEnabled: isVibrationEnabled,
      );
    }

    return null;
  }

  @override
  Map<String, bool>? toJson(VibrationState state) => state.when(
        loadInProgress: (bool isVibrationEnabled) => <String, bool>{_vibrationsKey: isVibrationEnabled},
        initial: (_, __) => null,
      );

  void _onEvent(VibrationEvent event, Emitter<VibrationState> emit) {
    final bool? isVibrationEnabled = event.whenOrNull(
      settingsChanged: (bool isEnabled) => isEnabled,
      vibrated: (int durationInMs) {
        if (state.isVibrationEnabled) {
          _vibrationService.vibrate(durationInMs: durationInMs);
        }

        return null;
      },
    );

    if (isVibrationEnabled != null) {
      emit(state.copyWith(isVibrationEnabled: isVibrationEnabled));
    }

    emit(
      _Initial(
        canVibrate: _vibrationService.hasCustomVibrationsSupport,
        isVibrationEnabled: isVibrationEnabled ?? state.isVibrationEnabled,
      ),
    );
  }
}
