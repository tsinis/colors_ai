abstract class AlertDialogState {
  const AlertDialogState();
}

class AlertDialogHiddenState extends AlertDialogState {
  const AlertDialogHiddenState();
}

class AlertDialogShowingState extends AlertDialogState {
  const AlertDialogShowingState();
}

//TODO! Handle error states.
class AlertDialogErrorState extends AlertDialogState {
  const AlertDialogErrorState();
}
