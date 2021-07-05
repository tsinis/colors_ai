import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/remove_favorites_repository.dart';

part 'remove_favs_event.dart';
part 'remove_favs_state.dart';

class RemoveFavoritesBloc extends Bloc<RemoveFavoritesEvent, RemoveFavoritesState> {
  RemoveFavoritesBloc() : super(const RemoveFavoritesSelectionChanged({}));

  final RemoveFavoritesRepository _removedFavs = RemoveFavoritesRepository(Set<int>.of({}));

  @override
  Stream<RemoveFavoritesState> mapEventToState(RemoveFavoritesEvent event) async* {
    if (event is RemoveFavoritesShowed) {
      yield RemoveFavoritesOpenDialogInitial(_removedFavs.selectons);
    } else if (event is RemoveFavoritesSelected) {
      yield RemoveFavoritesSelectionSelected(_removedFavs.selectons);
      _removedFavs.changeSelection(event.paletteIndex);
      yield RemoveFavoritesSelectionChanged(_removedFavs.selectons);
    } else {
      yield RemoveFavoritesSelectionChanged(_removedFavs.selectons);
    }
  }
}
