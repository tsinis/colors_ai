// ignore_for_file: unawaited_futures

import 'dart:ui' show Color;

import 'package:equatable/equatable.dart';
import 'package:stream_bloc/stream_bloc.dart';

import '../../../core/models/color_palette/color_palette.dart';
import '../../repository/favorites_repository.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends StreamBloc<FavoritesEvent, FavoritesState> {
  final FavoritesRepository _favorites;

  FavoritesBloc(this._favorites) : super(const FavoritesEmptyInitial());

  @override
  Stream<FavoritesState> mapEventToStates(FavoritesEvent event) async* {
    if (event is FavoritesStarted) {
      yield const FavoritesLoadInProgress();
      final bool isDataLoaded = await _favorites.loadStoredFavorites;
      if (isDataLoaded) {
        yield FavoritesLoadSuccess(_favorites.palettes);
      } else {
        yield const FavoritesEmptyInitial();
      }
    } else if (event is FavoritesAdded) {
      if (event.favorite.isNotEmpty) {
        _favorites.add(event.favorite);
        yield FavoritesLoadSuccess(_favorites.palettes);
        await _favorites.storage.add(event.favorite);
      } else {
        yield const FavoritesEmptyInitial();
      }
    } else if (event is FavoritesOneRemoved) {
      _favorites.remove(<int>{event.colorToRemoveIndex});
      if (_favorites.palettes.isNotEmpty) {
        yield FavoritesLoadSuccess(_favorites.palettes);
        await _favorites.storage.update(<int>{event.colorToRemoveIndex});
      } else {
        yield const FavoritesEmptyInitial();
        await _favorites.storage.clear();
      }
    } else if (event is FavoritesSeveralRemoved) {
      _favorites.remove(event.palettesIndex);
      if (_favorites.palettes.isNotEmpty) {
        yield FavoritesLoadSuccess(_favorites.palettes);
        _favorites.storage.update(event.palettesIndex);
      } else {
        yield const FavoritesEmptyInitial();
        _favorites.storage.clear();
      }
    }
  }
}
