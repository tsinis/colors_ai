import '../../repositories/saved_favorites_repository.dart';

abstract class SavedState {
  const SavedState();
}

class SavedEmptyState extends SavedState {}

class SavedErrorState extends SavedState {}

class SavedLoadingState extends SavedState {}

class SavedLoadedState extends SavedState {
  final SavedColors savedColors;

  const SavedLoadedState(this.savedColors);
}
