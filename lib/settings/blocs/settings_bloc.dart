import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../dao/generator_dao.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends HydratedBloc<SettingsEvent, SettingsState> {
  final String _colormindForUiKey;
  final GeneratorDAO _generatorSettings;
  final String _themeKey;

  SettingsBloc(this._generatorSettings, {String themeKey = 'isDark', String colormindForUiKey = 'forUI'})
      : _themeKey = themeKey,
        _colormindForUiKey = colormindForUiKey,
        super(const SettingsInitial());

  @override
  SettingsState? fromJson(Map<String, dynamic> json) {
    final bool? savedTheme = json[_themeKey] as bool?;
    final bool forUI = json[_colormindForUiKey] as bool? ?? false;
    _generatorSettings
      ..isDarkTheme = savedTheme
      ..colorsForUi = forUI;
  }

  @override
  Stream<SettingsState> mapEventToState(SettingsEvent event) async* {
    if (event is SettingsLightThemeSelected) {
      _generatorSettings.isDarkTheme = false;
    } else if (event is SettingsDarkThemeSelected) {
      _generatorSettings.isDarkTheme = true;
    } else if (event is SettingsSystemThemeSelected) {
      _generatorSettings.isDarkTheme = null;
    } else if (event is SettingsColorsForUiSelected) {
      _generatorSettings.colorsForUi = true;
    } else if (event is SettingsRegularColorsSelected) {
      _generatorSettings.colorsForUi = false;
    }
    try {
      yield SettingsChangedInitial(
        isDarkTheme: _generatorSettings.isDarkTheme,
        colorsForUi: _generatorSettings.colorsForUi,
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
