abstract class DialogEvent {
  const DialogEvent();
}

class ShowDialog extends DialogEvent {
  const ShowDialog();
}

class VisibleDialog extends DialogEvent {
  const VisibleDialog();
}
