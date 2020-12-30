import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../models/colors/colors_json.dart';
// import '../../repositories/colors_repository.dart';
import 'saved_event.dart';
import 'saved_state.dart';

class SavedBloc extends Bloc<SavedEvent, SavedState> {
  SavedBloc() : super(SavedEmptyState());
  //TODO! Add inital state.
  // final ColorsRepository colorsRepository;
  // SavedBloc(this.colorsRepository) : super(SavedEmptyState());

  @override
  Stream<SavedState> mapEventToState(SavedEvent event) async* {
    if (event is SavedExistingEvent) {
      yield SavedLoadingState();
      try {
        //TODO! Add caching repositrory;
        // ignore: avoid_catches_without_on_clauses
      } catch (_) {
        yield SavedErrorState();
      }
    }
    if (event is SavedRemovingEvent) {
      try {
        yield SavedLoadedState(event.colors);
        // ignore: avoid_catches_without_on_clauses
      } catch (_) {
        yield SavedErrorState();
      }
    }
  }
}
