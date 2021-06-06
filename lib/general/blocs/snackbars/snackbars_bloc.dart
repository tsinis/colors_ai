import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../services/clipboard.dart';
import '../../services/url_launcher.dart';

part 'snackbars_event.dart';
part 'snackbars_state.dart';

class SnackbarBloc extends Bloc<SnackbarEvent, SnackbarState> {
  SnackbarBloc() : super(const SnackbarsInitial());

  static const Clipboards _clipboard = Clipboards();

  @override
  Stream<SnackbarState> mapEventToState(SnackbarEvent event) async* {
    if (event is ColorCopiedSuccess) {
      final String? hex = await _clipboard.data;
      if (hex != null && hex.isNotEmpty) {
        yield ColorCopySuccess(hex);
      }
    } else if (event is UrlCopiedSuccess) {
      final String? url = await _clipboard.data;
      if (url != null && url.isNotEmpty) {
        yield UrlCopySuccess(url);
      }
    } else if (event is UrlOpenedSuccess) {
      final String? url = await _clipboard.data;
      if (url != null && url.isNotEmpty) {
        await const UrlLauncher().openURL(url);
      }
    } else if (event is ServerStatusCheckedSuccess) {
      if (DateTime.now().toUtc().hour == 7) {
        yield const ServerStatusCheckSuccess();
      }
    } else if (event is ShareFail) {
      yield const ShareAttemptFailure();
    }
    yield const SnackbarsInitial();
  }
}
