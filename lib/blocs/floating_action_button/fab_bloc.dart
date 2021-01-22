import 'package:flutter_bloc/flutter_bloc.dart';

import 'fab_event.dart';
import 'fab_state.dart';

// ignore_for_file: avoid_catches_without_on_clauses

class FabBloc extends Bloc<FabEvent, FabState> {
  FabBloc() : super(const FabInitial());
  @override
  Stream<FabState> mapEventToState(FabEvent event) async* {
    if (event is FabHided) {
      try {
        yield FabHideInitial();
      } catch (_) {
        yield const FabFailure();
      }
    } else if (event is FabShowed) {
      try {
        yield FabShowInitial();
      } catch (_) {
        yield const FabFailure();
      }
    }
  }
}
