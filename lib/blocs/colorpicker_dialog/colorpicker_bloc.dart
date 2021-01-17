import 'package:flutter_bloc/flutter_bloc.dart';

import 'colorpicker_event.dart';
import 'colorpicker_state.dart';

class DialogBloc extends Bloc<DialogEvent, DialogState> {
  DialogBloc() : super(const DialogHidedState());

  @override
  Stream<DialogState> mapEventToState(DialogEvent event) async* {
    if (event is ShowDialog) {
      yield const DialogShowing();
    } else {
      yield const DialogHidedState();
    }
  }
}
