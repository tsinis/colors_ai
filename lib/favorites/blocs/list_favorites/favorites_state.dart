part of 'favorites_bloc.dart';

abstract class FavoritesState extends Equatable {
  @override
  List<Object> get props => <Object>[];

  const FavoritesState();
}

class FavoritesEmptyInitial extends FavoritesState {
  const FavoritesEmptyInitial();
}

class FavoritesLoadInProgress extends FavoritesState {
  const FavoritesLoadInProgress();
}

class FavoritesLoadSuccess extends FavoritesState {
  final List<ColorPalette> palettes;

  @override
  List<Object> get props => <Object>[palettes.length];

  const FavoritesLoadSuccess(this.palettes);
}
