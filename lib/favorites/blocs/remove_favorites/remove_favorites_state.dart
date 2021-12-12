part of 'remove_favorites_bloc.dart';

abstract class RemoveFavoritesState extends Equatable {
  final Set<int> selections;

  @override
  List<Object> get props => <Object>[selections];

  const RemoveFavoritesState(this.selections);
}

class RemoveFavoritesOpenDialogInitial extends RemoveFavoritesState {
  const RemoveFavoritesOpenDialogInitial(Set<int> _selections) : super(_selections);
}

class RemoveFavoritesFailure extends RemoveFavoritesState {
  const RemoveFavoritesFailure() : super(const <int>{});
}

class RemoveFavoritesSelectionSelected extends RemoveFavoritesState {
  const RemoveFavoritesSelectionSelected(Set<int> _selections) : super(_selections);
}

class RemoveFavoritesSelectionChanged extends RemoveFavoritesState {
  const RemoveFavoritesSelectionChanged(Set<int> _selections) : super(_selections);
}
