import 'package:flutter_bloc/flutter_bloc.dart';

import 'settings_dialog_event.dart';
import 'settings_dialog_state.dart';

class SettingsDialogBloc extends Bloc<SettingsDialogEvent, SettingsDialogState> {
  SettingsDialogBloc() : super(const SettingsDialogCloseInitial());

  @override
  Stream<SettingsDialogState> mapEventToState(SettingsDialogEvent event) async* {
    if (event is SettingsDialogShowed) {
      yield const SettingsDialogOpenInitial();
    } else {
      yield const SettingsDialogCloseInitial();
    }
  }
}
