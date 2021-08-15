part of 'settings_hydrated_bloc.dart';

abstract class SettingsState extends Equatable {
  const SettingsState({required this.colorsForUi, this.isDarkTheme});

  final bool? isDarkTheme;
  final bool colorsForUi;

  @override
  List<bool?> get props => [isDarkTheme, colorsForUi];
}

class SettingsInitial extends SettingsState {
  const SettingsInitial() : super(colorsForUi: true);
}

class SettingsFailure extends SettingsState {
  const SettingsFailure() : super(colorsForUi: true);
}

class SettingsChangedInitial extends SettingsState {
  const SettingsChangedInitial({required bool colorsForUi, bool? isDarkTheme})
      : super(isDarkTheme: isDarkTheme, colorsForUi: colorsForUi);
}
