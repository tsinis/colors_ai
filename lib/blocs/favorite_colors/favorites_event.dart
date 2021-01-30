import 'dart:ui' show Color;

abstract class FavoritesEvent {
  const FavoritesEvent();
}

class FavoritesAdded extends FavoritesEvent {
  const FavoritesAdded({required this.colorsToSave});
  final List<Color> colorsToSave;
}

class FavoritesAllRemoved extends FavoritesEvent {
  const FavoritesAllRemoved();
}

class FavoritesOneRemoved extends FavoritesEvent {
  const FavoritesOneRemoved({required this.colorToRemoveIndex});
  final int colorToRemoveIndex;
}

class FavoritesLoadStarted extends FavoritesEvent {
  const FavoritesLoadStarted();
}
