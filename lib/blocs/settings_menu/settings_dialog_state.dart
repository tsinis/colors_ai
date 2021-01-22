import 'package:equatable/equatable.dart';

abstract class SettingsDialogState extends Equatable {
  const SettingsDialogState();

  @override
  List<Object> get props => [];
}

class SettingsDialogCloseInitial extends SettingsDialogState {
  const SettingsDialogCloseInitial();
}

class SettingsDialogOpenInitial extends SettingsDialogState {
  const SettingsDialogOpenInitial();
}

class SettingsDialogFailure extends SettingsDialogState {
  const SettingsDialogFailure();
}
