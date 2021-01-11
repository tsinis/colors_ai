import 'package:flutter_bloc/flutter_bloc.dart';

import 'fab_event.dart';
import 'fab_state.dart';

// ignore_for_file: avoid_catches_without_on_clauses

class FabBloc extends Bloc<FabEvent, FabState> {
  FabBloc() : super(FabShowingState());
  @override
  Stream<FabState> mapEventToState(FabEvent event) async* {
    if (event is FabReorderStartEvent) {
      try {
        yield FabReorderStartState();
      } catch (_) {
        yield FabShowingState();
      }
    } else if (event is FabReorderEndEvent) {
      try {
        yield FabReorderEndState();
      } catch (_) {
        yield FabShowingState();
      }
    }
  }
}
