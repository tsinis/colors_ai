import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/services/clipboard.dart';
import '../../../core/services/url_launcher.dart';
import '../../helpers/server_maintenance_check.dart';

part 'snackbar_event.dart';
part 'snackbar_state.dart';

class SnackbarBloc extends Bloc<SnackbarEvent, SnackbarState> {
  final ClipBoard _clipboard;
  final UrlLauncher _urlLauncher;

  SnackbarBloc({ClipBoard clipboard = const ClipBoard(), UrlLauncher urlLauncher = const UrlLauncher()})
      : _clipboard = clipboard,
        _urlLauncher = urlLauncher,
        super(const SnackbarsInitial());

  @override
  Stream<SnackbarState> mapEventToState(SnackbarEvent event) async* {
    if (event is ServerStatusCheckedSuccess) {
      if (serverMaintenanceNow(event.time)) {
        yield const ServerStatusCheckSuccess();
      }
    } else if (event is ShareFail) {
      yield const ShareAttemptFailure();
    } else {
      final String? clipboardData = await _clipboard.data;
      final bool isValidData = clipboardData != null && clipboardData.isNotEmpty;
      if (event is ColorCopiedSuccess) {
        yield isValidData ? ColorCopySuccess(clipboardData) : const ClipboardCopyFailure();
      } else if (event is UrlCopiedSuccess) {
        yield isValidData ? UrlCopySuccess(clipboardData) : const ClipboardCopyFailure();
      } else if (event is FileCopiedSuccess) {
        yield isValidData ? FileCopySuccess(event.format) : const ClipboardCopyFailure();
      } else if (event is UrlOpenedSuccess) {
        if (isValidData) {
          await _urlLauncher.openURL(clipboardData);
        }
      }
    }
    yield const SnackbarsInitial();
  }
}
