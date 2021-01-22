import '../../repositories/saved_favorites_repository.dart';

abstract class SaveState {
  const SaveState();
}

class SaveEmptyInitial extends SaveState {
  const SaveEmptyInitial();
}

class SaveFailure extends SaveState {
  const SaveFailure();
}

class SaveRemoveAllSuccess extends SaveState {
  const SaveRemoveAllSuccess();
}

class SaveLoadInProgress extends SaveState {}

class SaveLoadSuccess extends SaveState {
  SaveLoadSuccess(this.savedColors);
  final SavedColors savedColors;
}
