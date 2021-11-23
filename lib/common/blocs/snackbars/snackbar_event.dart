part of 'snackbar_bloc.dart';

abstract class SnackbarEvent extends Equatable {
  const SnackbarEvent();

  @override
  List<Object> get props => [];
}

class ShareFail extends SnackbarEvent {
  const ShareFail();
}

class UrlCopiedSuccess extends SnackbarEvent {
  const UrlCopiedSuccess();
}

class FileCopiedSuccess extends SnackbarEvent {
  const FileCopiedSuccess(this.format);

  final String format;
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
