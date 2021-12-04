part of 'settings_bloc.dart';

abstract class SettingsState extends Equatable {
  final bool colorsForUi;
  final bool? isDarkTheme;

  @override
  List<bool?> get props => [isDarkTheme, colorsForUi];

  const SettingsState({required this.colorsForUi, this.isDarkTheme});
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
