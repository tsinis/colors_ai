part of 'favorites_bloc.dart';

abstract class FavoritesEvent extends Equatable {
  const FavoritesEvent();
}

class FavoritesAdded extends FavoritesEvent {
  final List<Color> favorite;

  @override
  List<Object> get props => <Object>[favorite];

  const FavoritesAdded({required this.favorite});
}

class FavoritesSeveralRemoved extends FavoritesEvent {
  final Set<int> palettesIndex;

  @override
  List<Object> get props => <Object>[palettesIndex];

  const FavoritesSeveralRemoved(this.palettesIndex);
}

class FavoritesOneRemoved extends FavoritesEvent {
  final int colorToRemoveIndex;

  @override
  List<int> get props => <int>[colorToRemoveIndex];

  const FavoritesOneRemoved({required this.colorToRemoveIndex});
}

class FavoritesStarted extends FavoritesEvent {
  @override
  List<Object?> get props => <Object?>[];

  const FavoritesStarted();
}
