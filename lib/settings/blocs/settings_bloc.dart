import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../dao/generator_dao.dart';
import '../mixins/huemint_settings.dart';
import '../models/selected_api.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends HydratedBloc<SettingsEvent, SettingsState> {
  final String _colormindForUiKey;
  final GeneratorDAO _generatorSettings;
  final String _huemintAdjacencyKey;
  final String _huemintTemperatureKey;
  final String _selectedApiKey;
  final String _themeKey;

  SettingsBloc(
    this._generatorSettings, {
    String themeKey = 'isDark',
    String colormindForUiKey = 'colormindForUI',
    String huemintTemperatureKey = 'huemintTemperature',
    String huemintAdjacencyKey = 'huemintAdjacency',
    String selectedApiKey = 'api',
  })  : _themeKey = themeKey,
        _colormindForUiKey = colormindForUiKey,
        _huemintAdjacencyKey = huemintAdjacencyKey,
        _huemintTemperatureKey = huemintTemperatureKey,
        _selectedApiKey = selectedApiKey,
        super(const SettingsInitial());

  @override
  SettingsState? fromJson(Map<String, dynamic> json) {
    final bool? savedTheme = json[_themeKey] as bool?;
    final bool forUI = json[_colormindForUiKey] as bool? ?? false;
    final int huemintAdjacency = json[_huemintAdjacencyKey] as int? ?? 36;
    final double huemintTemperature = json[_huemintTemperatureKey] as double? ?? 1.2;
    final String apiName = json[_selectedApiKey] as String? ?? SelectedAPI.huemint.name;
    final SelectedAPI selectedApi = SelectedAPI.values.byName(apiName);

    _generatorSettings
      ..api = selectedApi
      ..isDarkTheme = savedTheme
      ..colormindForUI = forUI
      ..huemintAdjacency = huemintAdjacency
      ..huemintTemperature = huemintTemperature;

    return null;
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
      _generatorSettings.colormindForUI = true;
    } else if (event is SettingsRegularColorsSelected) {
      _generatorSettings.colormindForUI = false;
    } else if (event is SettingsTemperatureChanged) {
      _generatorSettings.huemintTemperature = event.temperature.clamp(
        HuemintSettings.temperatureMin,
        HuemintSettings.temperatureMax,
      );
    } else if (event is SettingsAdjacencyChanged) {
      _generatorSettings.huemintAdjacency = event.adjacency.clamp(
        HuemintSettings.adjacencyMin,
        HuemintSettings.adjacencyMax,
      );
    } else if (event is SettingsApiSelected) {
      if (event.api != null) {
        _generatorSettings.api = event.api!;
      }
    }
    try {
      yield SettingsChangedInitial(
        isDarkTheme: _generatorSettings.isDarkTheme,
        colormindForUI: _generatorSettings.colormindForUI,
        huemintAdjacency: _generatorSettings.huemintAdjacency,
        huemintTemperature: _generatorSettings.huemintTemperature,
        selectedAPI: _generatorSettings.api,
      );
    } on Exception catch (_) {
      yield const SettingsFailure();
    }
  }

  @override
  Map<String, dynamic>? toJson(SettingsState state) {
    if (state is SettingsChangedInitial) {
      return <String, Object?>{
        _themeKey: state.isDarkTheme,
        _colormindForUiKey: state.colormindForUI,
        _huemintAdjacencyKey: state.huemintAdjacency,
        _huemintTemperatureKey: state.huemintTemperature,
        _selectedApiKey: state.selectedAPI.name,
      };
    }

    return null;
  }
}
