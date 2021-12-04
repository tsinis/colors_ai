part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  @override
  List<Object> get props => [];

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

class SettingsStarted extends SettingsEvent {
  const SettingsStarted();
}
