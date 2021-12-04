part of 'favorites_bloc.dart';

abstract class FavoritesState extends Equatable {
  @override
  List<Object> get props => [];

  const FavoritesState();
}

class FavoritesEmptyInitial extends FavoritesState {
  const FavoritesEmptyInitial();
}

class FavoritesFailure extends FavoritesState {
  const FavoritesFailure();
}

class FavoritesLoadInProgress extends FavoritesState {
  const FavoritesLoadInProgress();
}

class FavoritesLoadSuccess extends FavoritesState {
  final List<ColorPalette> palettes;

  const FavoritesLoadSuccess(this.palettes);
}
