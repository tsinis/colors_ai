part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  @override
  List<Object?> get props => <Object>[];

  const SettingsEvent();
}

class SettingsLightThemeSelected extends SettingsEvent {
  const SettingsLightThemeSelected();
}

class SettingsDarkThemeSelected extends SettingsEvent {
  const SettingsDarkThemeSelected();
}

class SettingsSystemThemeSelected extends SettingsEvent {
  const SettingsSystemThemeSelected();
}

class SettingsColorsForUiSelected extends SettingsEvent {
  const SettingsColorsForUiSelected();
}

class SettingsRegularColorsSelected extends SettingsEvent {
  const SettingsRegularColorsSelected();
}

class SettingsApiSelected extends SettingsEvent {
  final SelectedAPI? api;

  @override
  List<Object?> get props => <Object?>[api];

  const SettingsApiSelected(this.api);
}

class SettingsTemperatureChanged extends SettingsEvent {
  final double temperature;

  @override
  List<double> get props => <double>[temperature];

  const SettingsTemperatureChanged(this.temperature);
}

class SettingsAdjacencyChanged extends SettingsEvent {
  final int adjacency;

  @override
  List<int> get props => <int>[adjacency];

  const SettingsAdjacencyChanged(this.adjacency);
}

class SettingsStarted extends SettingsEvent {
  const SettingsStarted();
}
