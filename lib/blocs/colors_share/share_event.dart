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

class ShareUrlCShared extends ShareEvent {
  const ShareUrlCShared(this.currentColors);
  final List<Color> currentColors;
}

class ShareUrlCopied extends ShareEvent {
  const ShareUrlCopied(this.currentColors);
  final List<Color> currentColors;
}
