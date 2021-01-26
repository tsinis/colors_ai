import '../../repositories/favorites_repository.dart';

abstract class FavoritesState {
  const FavoritesState();
}

class FavoritesEmptyInitial extends FavoritesState {
  const FavoritesEmptyInitial();
}

class FavoritesFailure extends FavoritesState {
  const FavoritesFailure();
}

class FavoritesRemoveAllSuccess extends FavoritesState {
  const FavoritesRemoveAllSuccess();
}

class FavoritesLoadInProgress extends FavoritesState {}

class FavoritesLoadSuccess extends FavoritesState {
  FavoritesLoadSuccess(this.favoriteColors);
  final FavoritesRepository favoriteColors;
}
