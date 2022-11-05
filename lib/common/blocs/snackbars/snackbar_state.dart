import '../../../core/constants.dart';

part 'snackbar_state.freezed.dart';

@freezedWithoutJson
class SnackbarState with _$SnackbarState {
  const factory SnackbarState.initial() = _SnackbarInitial;

  const factory SnackbarState.urlCopySuccess(String url) = _SnackbarUrlCopySuccess;
  const factory SnackbarState.fileCopySuccess(String format) = _SnackbarFileCopySuccess;
  const factory SnackbarState.colorCopySuccess(String hex) = _SnackbarColorCopySuccess;

  const factory SnackbarState.serverStatusCheck() = _SnackbarServerStatusCheck;

  const factory SnackbarState.shareFailure() = _SnackbarShareFailure;
  const factory SnackbarState.copyFailure() = _SnackbarCopyFailure;
  const factory SnackbarState.otherFailure() = _SnackbarOtherFailure;
}
