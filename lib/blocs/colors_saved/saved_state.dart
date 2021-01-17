import '../../repositories/saved_favorites_repository.dart';

abstract class SavedState {
  const SavedState();
}

class SavedEmptyState extends SavedState {
  const SavedEmptyState();
}

class SavedErrorState extends SavedState {
  const SavedErrorState();
}

class SavedRemoveAll extends SavedState {
  const SavedRemoveAll();
}

class SavedLoadingState extends SavedState {}

class SavedLoadedState extends SavedState {
  final SavedColors savedColors;

  const SavedLoadedState(this.savedColors);
}
