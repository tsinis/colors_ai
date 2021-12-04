import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/services/clipboards.dart';
import '../../../core/services/url_launcher.dart';
import '../../helpers/server_maintenance_check.dart';

part 'snackbar_event.dart';
part 'snackbar_state.dart';

class SnackbarBloc extends Bloc<SnackbarEvent, SnackbarState> {
  static const Clipboards _clipboard = Clipboards();

  SnackbarBloc() : super(const SnackbarsInitial());

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
    } else if (event is FileCopiedSuccess) {
      final String? file = await _clipboard.data;
      if (file != null && file.isNotEmpty) {
        yield FileCopySuccess(event.format);
      }
    } else if (event is UrlOpenedSuccess) {
      final String? url = await _clipboard.data;
      if (url != null && url.isNotEmpty) {
        await const UrlLauncher().openURL(url);
      }
    } else if (event is ServerStatusCheckedSuccess) {
      if (serverMaintenanceNow) {
        yield const ServerStatusCheckSuccess();
      }
    } else if (event is ShareFail) {
      yield const ShareAttemptFailure();
    }
    yield const SnackbarsInitial();
  }
}
