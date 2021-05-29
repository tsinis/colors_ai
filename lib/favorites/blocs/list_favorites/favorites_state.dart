part of 'favorites_bloc.dart';

abstract class FavoritesState extends Equatable {
  const FavoritesState();
  @override
  List<Object> get props => [];
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

class FavoritesLoadInProgress extends FavoritesState {
  const FavoritesLoadInProgress();
}

class FavoritesLoadSuccess extends FavoritesState {
  const FavoritesLoadSuccess(this.favoriteColors);
  final FavoritesRepository favoriteColors;
}
