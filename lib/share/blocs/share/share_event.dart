part of 'share_bloc.dart';

abstract class ShareEvent extends Equatable {
  const ShareEvent();
}

class ShareUrlProviderSelected extends ShareEvent {
  final int providerIndex;

  @override
  List<Object> get props => [providerIndex];

  const ShareUrlProviderSelected({required this.providerIndex});
}

class ShareStarted extends ShareEvent {
  @override
  List<Object> get props => [];

  const ShareStarted();
}

class ShareUrlShared extends ShareEvent {
  final ColorPalette palette;

  @override
  List<Object> get props => [palette];

  const ShareUrlShared(this.palette);
}

class ShareUrlCopied extends ShareEvent {
  final ColorPalette palette;

  @override
  List<Object> get props => [palette];

  const ShareUrlCopied(this.palette);
}

class ShareFileShared extends ShareEvent {
  final ColorPalette palette;

  @override
  List<Object> get props => [palette];

  const ShareFileShared(this.palette);
}

class ShareFileCopied extends ShareEvent {
  final ColorPalette palette;

  @override
  List<Object> get props => [palette];

  const ShareFileCopied(this.palette);
}

class ShareFormatSelected extends ShareEvent {
  final int formatIndex;

  @override
  List<Object> get props => [formatIndex];

  const ShareFormatSelected({required this.formatIndex});
}
