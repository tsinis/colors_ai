part of 'remove_favs_bloc.dart';

abstract class RemoveFavoritesState extends Equatable {
  const RemoveFavoritesState(this.selections);

  final Set<int> selections;

  @override
  List<Object> get props => [selections];
}

class RemoveFavoritesOpenDialogInitial extends RemoveFavoritesState {
  const RemoveFavoritesOpenDialogInitial(Set<int> _selections) : super(_selections);
}

class RemoveFavoritesFailure extends RemoveFavoritesState {
  const RemoveFavoritesFailure() : super(const {});
}

class RemoveFavoritesSelectionSelected extends RemoveFavoritesState {
  const RemoveFavoritesSelectionSelected(Set<int> _selections) : super(_selections);
}

class RemoveFavoritesSelectionChanged extends RemoveFavoritesState {
  const RemoveFavoritesSelectionChanged(Set<int> _selections) : super(_selections);
}
