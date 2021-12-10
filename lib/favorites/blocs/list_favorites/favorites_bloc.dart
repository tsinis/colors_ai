// ignore_for_file: avoid_catches_without_on_clauses, unawaited_futures
import 'dart:ui' show Color;

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/models/color_palette/color_palette.dart';
import '../../repository/favorites_repository.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final FavoritesRepository _favorites;

  FavoritesBloc(this._favorites) : super(const FavoritesEmptyInitial());

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
      if (event.favorite.isNotEmpty) {
        _favorites.add(event.favorite);
        try {
          yield FavoritesLoadSuccess(_favorites.palettes);
        } catch (_) {
          yield const FavoritesFailure();
        }
        await _favorites.storage.add(event.favorite);
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
          await _favorites.storage.update({event.colorToRemoveIndex});
        } else {
          yield const FavoritesEmptyInitial();
          await _favorites.storage.clear();
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
      _favorites.storage.update(event.palettesIndex);
    }
  }
}
