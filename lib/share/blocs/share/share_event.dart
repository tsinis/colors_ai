part of 'share_hydrated_bloc.dart';

abstract class ShareEvent extends Equatable {
  const ShareEvent();

  @override
  List<Object> get props => [];
}

class ShareUrlProviderSelected extends ShareEvent {
  const ShareUrlProviderSelected({required this.providerIndex});
  final int providerIndex;
}

class ShareStarted extends ShareEvent {
  const ShareStarted();
}

class ShareUrlShared extends ShareEvent {
  const ShareUrlShared(this.palette);
  final ColorPalette palette;
}

class ShareUrlCopied extends ShareEvent {
  const ShareUrlCopied(this.palette);
  final ColorPalette palette;
}

class ShareFileShared extends ShareEvent {
  const ShareFileShared(this.palette);
  final ColorPalette palette;
}

class ShareFileCopied extends ShareEvent {
  const ShareFileCopied(this.palette);
  final ColorPalette palette;
}

class ShareFormatSelected extends ShareEvent {
  const ShareFormatSelected({required this.formatIndex});
  final int formatIndex;
}
