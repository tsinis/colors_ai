part of 'remove_favorites_bloc.dart';

abstract class RemoveFavoritesState extends Equatable {
  final Set<int> selections;

  @override
  List<Object> get props => <Object>[selections];

  const RemoveFavoritesState(this.selections);
}

class RemoveFavoritesOpenDialogInitial extends RemoveFavoritesState {
  const RemoveFavoritesOpenDialogInitial(super.selections);
}

class RemoveFavoritesSelectionSelected extends RemoveFavoritesState {
  const RemoveFavoritesSelectionSelected(super.selections);
}

class RemoveFavoritesSelectionChanged extends RemoveFavoritesState {
  const RemoveFavoritesSelectionChanged(super.selections);
}
