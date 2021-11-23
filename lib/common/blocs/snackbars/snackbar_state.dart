part of 'snackbar_bloc.dart';

abstract class SnackbarState extends Equatable {
  const SnackbarState(this.clipboard);

  final String clipboard;

  @override
  List<Object> get props => [clipboard];
}

class SnackbarsInitial extends SnackbarState {
  const SnackbarsInitial() : super('');
}

class UrlCopySuccess extends SnackbarState {
  const UrlCopySuccess(this.url) : super(url);

  final String url;
}

class FileCopySuccess extends SnackbarState {
  const FileCopySuccess(this.format) : super(format);

  final String format;
}

class ColorCopySuccess extends SnackbarState {
  const ColorCopySuccess(this.hex) : super(hex);

  final String hex;
}

class ServerStatusCheckSuccess extends SnackbarState {
  const ServerStatusCheckSuccess() : super('');
}

class ShareAttemptFailure extends SnackbarState {
  const ShareAttemptFailure() : super('');
}
