import 'dart:async';

import 'package:stream_bloc/stream_bloc.dart';

import '../../../core/services/clipboard.dart';
import '../../../core/services/url_launcher.dart';
import '../../helpers/server_maintenance_check.dart';
import 'snackbar_event.dart';
import 'snackbar_state.dart';

export 'snackbar_event.dart';
export 'snackbar_state.dart';

class SnackbarBloc extends StreamBloc<SnackbarEvent, SnackbarState> {
  final ClipBoard _clipboard;
  final UrlLauncher _urlLauncher;

  SnackbarBloc({ClipBoard clipboard = const ClipBoard(), UrlLauncher urlLauncher = const UrlLauncher()})
      : _clipboard = clipboard,
        _urlLauncher = urlLauncher,
        super(const SnackbarState.initial());

  @override
  Stream<SnackbarState> mapEventToStates(SnackbarEvent event) async* {
    await event.whenOrNull(urlOpened: _urlLauncher.openURL);

    yield* event.maybeWhen(
      shareFailed: () async* {
        yield const SnackbarState.shareFailure();
      },
      serverStatusChecked: (DateTime? time) async* {
        if (serverMaintenanceNow(time)) {
          yield const SnackbarState.serverStatusCheck();
        }
      },
      // ignore: avoid-redundant-async, it's asynchronous generator not Future.
      urlOpened: (_) async* {
        const SnackbarState.initial();
      },
      orElse: () async* {
        final String? clipboardData = await _clipboard.data;
        final bool isValidData = clipboardData != null && clipboardData.isNotEmpty;
        if (isValidData) {
          final SnackbarState? state = event.whenOrNull(
            fileCopied: SnackbarState.fileCopySuccess,
            urlCopied: () => SnackbarState.urlCopySuccess(clipboardData),
            colorCopied: () => SnackbarState.colorCopySuccess(clipboardData),
          );
          if (state != null) {
            yield state;
          }
        } else {
          yield const SnackbarState.copyFailure();
        }
      },
    );
    yield const SnackbarState.initial();
  }
}
