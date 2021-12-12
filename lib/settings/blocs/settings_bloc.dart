import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../repository/settings_repository.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends HydratedBloc<SettingsEvent, SettingsState> {
  final String _colormindForUiKey;
  final SettingsRepository _settings;
  final String _themeKey;

  SettingsBloc(this._settings, {String themeKey = 'isDark', String colormindForUiKey = 'forUI'})
      : _themeKey = themeKey,
        _colormindForUiKey = colormindForUiKey,
        super(const SettingsInitial());

  @override
  SettingsState? fromJson(Map<String, dynamic> json) {
    final bool? savedTheme = json[_themeKey] as bool?;
    final bool forUI = json[_colormindForUiKey] as bool? ?? false;
    _settings
      ..isDarkTheme = savedTheme
      ..colorsForUi = forUI;
  }

  @override
  Stream<SettingsState> mapEventToState(SettingsEvent event) async* {
    if (event is SettingsLightThemeSelected) {
      _settings.isDarkTheme = false;
    } else if (event is SettingsDarkThemeSelected) {
      _settings.isDarkTheme = true;
    } else if (event is SettingsSystemThemeSelected) {
      _settings.isDarkTheme = null;
    } else if (event is SettingsColorsForUiSelected) {
      _settings.colorsForUi = true;
    } else if (event is SettingsRegularColorsSelected) {
      _settings.colorsForUi = false;
    }
    try {
      yield SettingsChangedInitial(
        isDarkTheme: _settings.isDarkTheme,
        colorsForUi: _settings.colorsForUi,
      );
    } on Exception catch (_) {
      yield const SettingsFailure();
    }
  }

  @override
  Map<String, dynamic>? toJson(SettingsState state) {
    if (state is SettingsChangedInitial) {
      return <String, dynamic>{_themeKey: state.isDarkTheme, _colormindForUiKey: state.colorsForUi};
    }
  }
}
