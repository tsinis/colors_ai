import 'package:equatable/equatable.dart';

abstract class SettingsDialogEvent extends Equatable {
  const SettingsDialogEvent();

  @override
  List<Object> get props => [];
}

class SettingsDialogShowed extends SettingsDialogEvent {
  const SettingsDialogShowed();
}

class SettingsDialogHided extends SettingsDialogEvent {
  const SettingsDialogHided();
}
