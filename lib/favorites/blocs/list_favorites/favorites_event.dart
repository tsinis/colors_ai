part of 'favorites_bloc.dart';

abstract class FavoritesEvent {
  const FavoritesEvent();
}

class FavoritesAdded extends FavoritesEvent {
  const FavoritesAdded({required this.favorite});
  final ColorPalette favorite;
}

class FavoritesSeveralRemoved extends FavoritesEvent {
  const FavoritesSeveralRemoved(this.palettesIndex);
  final Set<int> palettesIndex;
}

class FavoritesOneRemoved extends FavoritesEvent {
  const FavoritesOneRemoved({required this.colorToRemoveIndex});
  final int colorToRemoveIndex;
}

class FavoritesLoadStarted extends FavoritesEvent {
  const FavoritesLoadStarted();
}
