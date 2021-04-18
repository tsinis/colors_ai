import 'package:flutter_bloc/flutter_bloc.dart';

import 'fab_event.dart';
import 'fab_state.dart';

class FabBloc extends Bloc<FabEvent, FabState> {
  FabBloc() : super(const FabInitial());

  @override
  Stream<FabState> mapEventToState(FabEvent event) async* {
    if (event is FabHided) {
      try {
        yield FabHideInitial();
      } on Exception catch (_) {
        yield const FabFailure();
      }
    } else if (event is FabShowed) {
      try {
        yield FabShowInitial();
      } on Exception catch (_) {
        yield const FabFailure();
      }
    }
  }
}
