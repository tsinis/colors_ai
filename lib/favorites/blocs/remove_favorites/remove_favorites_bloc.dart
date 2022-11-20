import 'package:equatable/equatable.dart';
import 'package:stream_bloc/stream_bloc.dart';

import '../../repository/remove_favorites_repository.dart';

part 'remove_favorites_event.dart';
part 'remove_favorites_state.dart';

class RemoveFavoritesBloc extends StreamBloc<RemoveFavoritesEvent, RemoveFavoritesState> {
  final RemoveFavoritesRepository _removedFavs;

  RemoveFavoritesBloc(this._removedFavs) : super(const RemoveFavoritesSelectionChanged(<int>{}));

  @override
  Stream<RemoveFavoritesState> mapEventToStates(RemoveFavoritesEvent event) async* {
    if (event is RemoveFavoritesShowed) {
      yield RemoveFavoritesOpenDialogInitial(_removedFavs.selections);
    } else if (event is RemoveFavoritesRemoved) {
      yield RemoveFavoritesSelectionSelected(_removedFavs.selections);
      _removedFavs.clearSelections();
      yield RemoveFavoritesSelectionChanged(_removedFavs.selections);
    } else if (event is RemoveFavoritesSelected) {
      yield RemoveFavoritesSelectionSelected(_removedFavs.selections);
      _removedFavs.changeSelection(event.paletteIndex);
      yield RemoveFavoritesSelectionChanged(_removedFavs.selections);
    } else {
      yield RemoveFavoritesSelectionChanged(_removedFavs.selections);
    }
  }
}
