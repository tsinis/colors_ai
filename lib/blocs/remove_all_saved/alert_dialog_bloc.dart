import 'package:flutter_bloc/flutter_bloc.dart';

import 'alert_dialog_event.dart';
import 'alert_dialog_state.dart';

class AlertDialogBloc extends Bloc<AlertDialogEvent, AlertDialogState> {
  AlertDialogBloc() : super(const AlertDialogHiddenState());

  @override
  Stream<AlertDialogState> mapEventToState(AlertDialogEvent event) async* {
    if (event is ShowAlertDialog) {
      yield const AlertDialogShowingState();
    } else {
      yield const AlertDialogHiddenState();
    }
  }
}
