part of 'snackbar_bloc.dart';

abstract class SnackbarState extends Equatable {
  final String clipboard;

  @override
  List<String> get props => <String>[clipboard];

  const SnackbarState(this.clipboard);
}

class SnackbarsInitial extends SnackbarState {
  const SnackbarsInitial() : super('');
}

class UrlCopySuccess extends SnackbarState {
  final String url;

  const UrlCopySuccess(this.url) : super(url);
}

class FileCopySuccess extends SnackbarState {
  final String format;

  const FileCopySuccess(this.format) : super(format);
}

class ColorCopySuccess extends SnackbarState {
  final String hex;

  const ColorCopySuccess(this.hex) : super(hex);
}

class ServerStatusCheckSuccess extends SnackbarState {
  const ServerStatusCheckSuccess() : super('');
}

class ShareAttemptFailure extends SnackbarState {
  const ShareAttemptFailure() : super('');
}

class ClipboardCopyFailure extends SnackbarState {
  const ClipboardCopyFailure() : super(''); // TODO Provide on UI.
}
