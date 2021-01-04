import 'package:flutter_bloc/flutter_bloc.dart';

import 'colorpicker_event.dart';
import 'colorpicker_state.dart';

class DialogBloc extends Bloc<DialogEvent, DialogState> {
  DialogBloc() : super(InitialDialogState());

  @override
  Stream<DialogState> mapEventToState(DialogEvent event) async* {
    if (event is ShowDialog) {
      yield DialogShowing();
    } else {
      yield InitialDialogState();
    }
  }
}
