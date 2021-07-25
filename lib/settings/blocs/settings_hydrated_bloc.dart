import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../repository/settings_repository.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends HydratedBloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(const SettingsInitial());

  final SettingsRepository _settings = SettingsRepository();

  @override
  Stream<SettingsState> mapEventToState(SettingsEvent event) async* {
    if (event is SettingsLightThemeSelected) {
      _settings.isDarkTheme = false;
    } else if (event is SettingsDarkThemeSelected) {
      _settings.isDarkTheme = true;
    } else if (event is SettingsSystemThemeSelected) {
      _settings.isDarkTheme = null;
    }
    try {
      yield SettingsChangedInitial(isDarkTheme: _settings.isDarkTheme);
    } on Exception catch (_) {
      yield const SettingsFailure();
    }
  }

  @override
  SettingsState? fromJson(Map<String, dynamic> json) {
    final bool? savedTheme = json['isDark'] as bool?;
    _settings.isDarkTheme = savedTheme;
  }

  @override
  Map<String, dynamic>? toJson(SettingsState state) {
    if (state is SettingsChangedInitial) {
      return <String, dynamic>{'isDark': state.isDarkTheme};
    }
  }
}
