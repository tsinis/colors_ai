part of 'remove_favorites_bloc.dart';

abstract class RemoveFavoritesEvent extends Equatable {
  @override
  List<Object> get props => <Object>[];

  const RemoveFavoritesEvent();
}

class RemoveFavoritesShowed extends RemoveFavoritesEvent {
  const RemoveFavoritesShowed();
}

class RemoveFavoritesHided extends RemoveFavoritesEvent {
  const RemoveFavoritesHided();
}

class RemoveFavoritesSelected extends RemoveFavoritesEvent {
  final int paletteIndex;

  @override
  List<int> get props => <int>[paletteIndex];

  const RemoveFavoritesSelected(this.paletteIndex);
}

class RemoveFavoritesRemoved extends RemoveFavoritesEvent {
  const RemoveFavoritesRemoved();
}
