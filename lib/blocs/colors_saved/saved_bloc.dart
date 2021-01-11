// ignore_for_file: avoid_catches_without_on_clauses
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/saved_favorites_repository.dart';
import 'saved_event.dart';
import 'saved_state.dart';

class SavedBloc extends Bloc<SavedEvent, SavedState> {
  SavedBloc() : super(SavedEmptyState());

  // ignore: prefer_const_constructors
  static final SavedColors _savedRepository = SavedColors();

  @override
  Stream<SavedState> mapEventToState(SavedEvent event) async* {
    if (event is SavedAddEvent) {
      _savedRepository.add(event.colorsToSave);
      try {
        yield SavedLoadedState(_savedRepository);
      } catch (_) {
        yield SavedErrorState();
      }
    }
    if (event is SavedRemovingEvent) {
      try {
        yield SavedLoadedState(_savedRepository);
      } catch (_) {
        yield SavedErrorState();
      }
    }
  }
}
