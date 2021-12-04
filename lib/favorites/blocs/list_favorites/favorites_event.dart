part of 'favorites_bloc.dart';

abstract class FavoritesEvent {
  const FavoritesEvent();
}

class FavoritesAdded extends FavoritesEvent {
  final ColorPalette favorite;

  const FavoritesAdded({required this.favorite});
}

class FavoritesSeveralRemoved extends FavoritesEvent {
  final Set<int> palettesIndex;

  const FavoritesSeveralRemoved(this.palettesIndex);
}

class FavoritesOneRemoved extends FavoritesEvent {
  final int colorToRemoveIndex;

  const FavoritesOneRemoved({required this.colorToRemoveIndex});
}

class FavoritesStarted extends FavoritesEvent {
  const FavoritesStarted();
}
