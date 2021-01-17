abstract class DialogState {
  const DialogState();
}

class DialogHidedState extends DialogState {
  const DialogHidedState();
}

class DialogShowing extends DialogState {
  const DialogShowing();
}

//TODO! Handle error states.
class DialogErrorState extends DialogState {
  const DialogErrorState();
}
