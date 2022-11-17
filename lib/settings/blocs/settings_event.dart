import '../../core/constants.dart';
import '../models/selected_api.dart';

part 'settings_event.freezed.dart';

@freezedWithoutJson
class SettingsEvent with _$SettingsEvent {
  const factory SettingsEvent.started() = _Started;
  const factory SettingsEvent.lightThemeSelected() = _LightThemeSelected;
  const factory SettingsEvent.darkThemeSelected() = _DarkThemeSelected;
  const factory SettingsEvent.systemThemeSelected() = _SystemThemeSelected;
  const factory SettingsEvent.colorsForUiSelected() = _ColorsForUiSelected;
  const factory SettingsEvent.colorsRegularSelected() = _ColorsRegularSelected;
  const factory SettingsEvent.apiSelected(SelectedAPI? api) = _ApiSelected;
  const factory SettingsEvent.adjacencyChanged(int adjacency) = _AdjacencyChanged;
  const factory SettingsEvent.temperatureSelected(double temperature) = _TemperatureSelected;
}
