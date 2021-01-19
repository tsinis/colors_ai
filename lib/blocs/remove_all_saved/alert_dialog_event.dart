abstract class AlertDialogEvent {
  const AlertDialogEvent();
}

class ShowAlertDialog extends AlertDialogEvent {
  const ShowAlertDialog();
}

class HideAlertDialog extends AlertDialogEvent {
  const HideAlertDialog();
}
