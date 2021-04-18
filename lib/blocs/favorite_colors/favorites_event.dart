import '../../models/hive/color_palette.dart';

abstract class FavoritesEvent {
  const FavoritesEvent();
}

class FavoritesAdded extends FavoritesEvent {
  const FavoritesAdded({required this.favorite});
  final ColorPalette favorite;
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
