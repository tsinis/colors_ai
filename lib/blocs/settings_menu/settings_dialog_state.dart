abstract class SettingsDialogState {
  const SettingsDialogState();
}

class SettingsDialogHiddenState extends SettingsDialogState {
  const SettingsDialogHiddenState();
}

class SettingsDialogShowingState extends SettingsDialogState {
  const SettingsDialogShowingState();
}

//TODO! Handle error states.
class SettingsDialogErrorState extends SettingsDialogState {
  const SettingsDialogErrorState();
}
