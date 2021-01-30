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
  const ShareUrlShared(this.currentColors);
  final List<Color> currentColors;
}

class ShareUrlCopied extends ShareEvent {
  const ShareUrlCopied(this.currentColors);
  final List<Color> currentColors;
}
