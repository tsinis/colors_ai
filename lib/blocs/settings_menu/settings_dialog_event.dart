abstract class SettingsDialogEvent {
  const SettingsDialogEvent();
}

class ShowSettingsDialog extends SettingsDialogEvent {
  const ShowSettingsDialog();
}

class HideSettingsDialog extends SettingsDialogEvent {
  const HideSettingsDialog();
}
