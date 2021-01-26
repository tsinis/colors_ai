// ignore_for_file: avoid_catches_without_on_clauses
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/favorites_repository.dart';
import 'favorites_event.dart';
import 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc() : super(const FavoritesEmptyInitial());

  static const FavoritesRepository _favoritesRepository = FavoritesRepository();

  @override
  Stream<FavoritesState> mapEventToState(FavoritesEvent event) async* {
    if (event is FavoritesAdded) {
      if (event.colorsToSave.isNotEmpty) {
        _favoritesRepository.add(event.colorsToSave);
        try {
          yield FavoritesLoadSuccess(_favoritesRepository);
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
    } else if (event is FavoritesOneRemoved) {
      _favoritesRepository.remove(event.colorToRemoveIndex);
      try {
        if (_favoritesRepository.list.isEmpty) {
          yield const FavoritesEmptyInitial();
        } else {
          yield FavoritesLoadSuccess(_favoritesRepository);
        }
      } catch (_) {
        yield const FavoritesFailure();
      }
    } else if (event is FavoritesAllRemoved) {
      _favoritesRepository.removeAll;
      try {
        yield const FavoritesEmptyInitial();
      } catch (_) {
        yield const FavoritesFailure();
      }
    }
  }
}
