part of 'share_bloc.dart';

abstract class ShareEvent extends Equatable {
  const ShareEvent();

  @override
  List<Object> get props => [];
}

class ShareUrlProviderChanged extends ShareEvent {
  const ShareUrlProviderChanged(this.newProviderIndex);
  final int newProviderIndex;
}

class ShareUrlShared extends ShareEvent {
  const ShareUrlShared(this.palette);
  final ColorPalette palette;
}

class ShareUrlCopied extends ShareEvent {
  const ShareUrlCopied(this.palette);
  final ColorPalette palette;
}
