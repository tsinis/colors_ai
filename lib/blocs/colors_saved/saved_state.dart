abstract class SavedState {
  const SavedState();
}

class SavedEmptyState extends SavedState {}

class SavedErrorState extends SavedState {}

class SavedLoadingState extends SavedState {}

class SavedLoadedState extends SavedState {}
