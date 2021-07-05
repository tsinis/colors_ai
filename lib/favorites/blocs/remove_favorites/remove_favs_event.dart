part of 'remove_favs_bloc.dart';

abstract class RemoveFavoritesEvent extends Equatable {
  const RemoveFavoritesEvent();

  @override
  List<Object> get props => [];
}

class RemoveFavoritesShowed extends RemoveFavoritesEvent {
  const RemoveFavoritesShowed();
}

class RemoveFavoritesHided extends RemoveFavoritesEvent {
  const RemoveFavoritesHided();
}

class RemoveFavoritesSelected extends RemoveFavoritesEvent {
  const RemoveFavoritesSelected(this.paletteIndex);
  final int paletteIndex;
}
