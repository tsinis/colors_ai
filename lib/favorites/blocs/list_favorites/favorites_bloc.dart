// ignore_for_file: avoid_catches_without_on_clauses, unawaited_futures
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../general/models/color_palette/color_palette.dart';
import '../../repository/favorites_repository.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc() : super(const FavoritesEmptyInitial());

  static const FavoritesRepository _favorites = FavoritesRepository();

  @override
  Stream<FavoritesState> mapEventToState(FavoritesEvent event) async* {
    if (event is FavoritesLoadStarted) {
      yield const FavoritesLoadInProgress();
      final bool? isDataLoaded = await _favorites.loadStoredFavorites;
      if (isDataLoaded != false) {
        try {
          yield const FavoritesLoadSuccess(_favorites);
        } catch (_) {
          yield const FavoritesFailure();
        }
      } else {
        try {
          yield const FavoritesEmptyInitial();
        } catch (_) {
          yield const FavoritesFailure();
        }
      }
    } else if (event is FavoritesAdded) {
      if (event.favorite.colors.isNotEmpty) {
        _favorites.add(event.favorite);
        try {
          yield const FavoritesLoadSuccess(_favorites);
        } catch (_) {
          yield const FavoritesFailure();
        }
        _favorites.addToStorage();
      } else {
        try {
          yield const FavoritesEmptyInitial();
        } catch (_) {
          yield const FavoritesFailure();
        }
      }
    } else if (event is FavoritesOneRemoved) {
      _favorites.remove(event.colorToRemoveIndex);
      try {
        if (_favorites.list.isNotEmpty) {
          yield const FavoritesLoadSuccess(_favorites);
          _favorites.updateStorage(event.colorToRemoveIndex);
        } else {
          yield const FavoritesEmptyInitial();
          await _favorites.clearStorage();
        }
      } catch (_) {
        yield const FavoritesFailure();
      }
    } else if (event is FavoritesAllRemoved) {
      _favorites.removeAll();
      try {
        yield const FavoritesEmptyInitial();
      } catch (_) {
        yield const FavoritesFailure();
      }
      await _favorites.clearStorage();
    }
  }
}
