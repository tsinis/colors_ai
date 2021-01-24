// ignore_for_file: avoid_catches_without_on_clauses
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/saved_favorites_repository.dart';
import 'saved_event.dart';
import 'saved_state.dart';

class SavedBloc extends Bloc<SaveEvent, SaveState> {
  SavedBloc() : super(const SaveEmptyInitial());

  static const SavedColorsRepository _savedRepository = SavedColorsRepository();

  @override
  Stream<SaveState> mapEventToState(SaveEvent event) async* {
    if (event is SaveAdded) {
      _savedRepository.add(event.colorsToSave);
      try {
        yield SaveLoadSuccess(_savedRepository);
      } catch (_) {
        yield const SaveFailure();
      }
    } else if (event is SaveOneRemoved) {
      _savedRepository.remove(event.colorToRemoveIndex);
      try {
        if (_savedRepository.list.isEmpty) {
          yield const SaveEmptyInitial();
        } else {
          yield SaveLoadSuccess(_savedRepository);
        }
      } catch (_) {
        yield const SaveFailure();
      }
    } else if (event is SaveAllRemoved) {
      _savedRepository.removeAll;
      try {
        yield const SaveEmptyInitial();
      } catch (_) {
        yield const SaveFailure();
      }
    }
  }
}
