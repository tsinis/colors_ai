import 'package:flutter_bloc/flutter_bloc.dart';

import 'settings_dialog_event.dart';
import 'settings_dialog_state.dart';

class SettingsDialogBloc extends Bloc<SettingsDialogEvent, SettingsDialogState> {
  SettingsDialogBloc() : super(const SettingsDialogHiddenState());

  @override
  Stream<SettingsDialogState> mapEventToState(SettingsDialogEvent event) async* {
    if (event is ShowSettingsDialog) {
      yield const SettingsDialogShowingState();
    } else {
      yield const SettingsDialogHiddenState();
    }
  }
}
