part of 'settings_hydrated_bloc.dart';

abstract class SettingsState extends Equatable {
  const SettingsState({this.isDarkTheme});

  final bool? isDarkTheme;

  @override
  List<bool?> get props => [isDarkTheme];
}

class SettingsInitial extends SettingsState {
  const SettingsInitial();
}

class SettingsFailure extends SettingsState {
  const SettingsFailure();
}

class SettingsChangedInitial extends SettingsState {
  const SettingsChangedInitial({bool? isDarkTheme}) : super(isDarkTheme: isDarkTheme);
}
