import 'package:flutter_bloc/flutter_bloc.dart';

import 'fab_event.dart';
import 'fab_state.dart';

// ignore_for_file: avoid_catches_without_on_clauses

class FabBloc extends Bloc<FabEvent, FabState> {
  FabBloc() : super(const FabDefaultState());
  @override
  Stream<FabState> mapEventToState(FabEvent event) async* {
    if (event is FabHideEvent) {
      try {
        yield FabHideState();
      } catch (_) {
        yield const FabErrorState();
      }
    } else if (event is FabShowEvent) {
      try {
        yield FabShowState();
      } catch (_) {
        yield const FabErrorState();
      }
    }
  }
}
