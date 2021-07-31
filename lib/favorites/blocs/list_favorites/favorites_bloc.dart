// ignore_for_file: avoid_catches_without_on_clauses, unawaited_futures
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/models/color_palette/color_palette.dart';
import '../../repository/favorites_repository.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc() : super(const FavoritesEmptyInitial());

  final FavoritesRepository _favorites = FavoritesRepository(List<ColorPalette>.empty(growable: true));

  @override
  Stream<FavoritesState> mapEventToState(FavoritesEvent event) async* {
    if (event is FavoritesStarted) {
      yield const FavoritesLoadInProgress();
      final bool isDataLoaded = await _favorites.loadStoredFavorites;
      if (isDataLoaded) {
        try {
          yield FavoritesLoadSuccess(_favorites.palettes);
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
          yield FavoritesLoadSuccess(_favorites.palettes);
        } catch (_) {
          yield const FavoritesFailure();
        }
        _favorites.addToStorage(event.favorite);
      } else {
        try {
          yield const FavoritesEmptyInitial();
        } catch (_) {
          yield const FavoritesFailure();
        }
      }
    } else if (event is FavoritesOneRemoved) {
      _favorites.remove({event.colorToRemoveIndex});
      try {
        if (_favorites.palettes.isNotEmpty) {
          yield FavoritesLoadSuccess(_favorites.palettes);
          _favorites.updateStorage({event.colorToRemoveIndex});
        } else {
          yield const FavoritesEmptyInitial();
          await _favorites.clearStorage();
        }
      } catch (_) {
        yield const FavoritesFailure();
      }
    } else if (event is FavoritesSeveralRemoved) {
      _favorites.remove(event.palettesIndex);
      try {
        if (_favorites.palettes.isNotEmpty) {
          yield FavoritesLoadSuccess(_favorites.palettes);
        } else {
          yield const FavoritesEmptyInitial();
        }
      } catch (_) {
        yield const FavoritesFailure();
      }
      _favorites.updateStorage(event.palettesIndex);
    }
  }
}
