import '../../../core/constants.dart';

part 'snackbar_event.freezed.dart';

@freezedWithoutJson
class SnackbarEvent with _$SnackbarEvent {
  const factory SnackbarEvent.shareFailed() = _SnackbarShareFailed;
  const factory SnackbarEvent.urlCopied() = _SnackbarUrlCopied;
  const factory SnackbarEvent.urlOpened(String url) = _SnackbarUrlOpened;
  const factory SnackbarEvent.fileCopied(String format) = _SnackbarFileCopied;
  const factory SnackbarEvent.colorCopied() = _SnackbarColorCopied;
  const factory SnackbarEvent.serverStatusChecked([DateTime? time]) = _SnackbarServerStatusChecked;
}
