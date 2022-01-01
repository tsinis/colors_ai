part of 'snackbar_bloc.dart';

abstract class SnackbarEvent extends Equatable {
  @override
  List<Object> get props => <Object>[];

  const SnackbarEvent();
}

class ShareFail extends SnackbarEvent {
  const ShareFail();
}

class UrlCopiedSuccess extends SnackbarEvent {
  const UrlCopiedSuccess();
}

class FileCopiedSuccess extends SnackbarEvent {
  final String format;

  @override
  List<String> get props => <String>[format];

  const FileCopiedSuccess(this.format);
}

class UrlOpenedSuccess extends SnackbarEvent {
  const UrlOpenedSuccess();
}

class ColorCopiedSuccess extends SnackbarEvent {
  const ColorCopiedSuccess();
}

class ServerStatusCheckedSuccess extends SnackbarEvent {
  const ServerStatusCheckedSuccess();
}
