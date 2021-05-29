import 'package:flutter_bloc/flutter_bloc.dart';

import 'alert_dialog_event.dart';
import 'alert_dialog_state.dart';

class AlertDialogBloc extends Bloc<AlertDialogEvent, AlertDialogState> {
  AlertDialogBloc() : super(const AlertDialogCloseInitial());

  @override
  Stream<AlertDialogState> mapEventToState(AlertDialogEvent event) async* {
    if (event is AlertDialogShowed) {
      yield const AlertDialogOpenInitial();
    } else {
      yield const AlertDialogCloseInitial();
    }
  }
}
