part of 'share_hydrated_bloc.dart';

abstract class ShareEvent extends Equatable {
  const ShareEvent();

  @override
  List<Object> get props => [];
}

class ShareUrlProviderSelected extends ShareEvent {
  const ShareUrlProviderSelected({this.providerIndex});
  final int? providerIndex;
}

class ShareUrlShared extends ShareEvent {
  const ShareUrlShared(this.palette);
  final ColorPalette palette;
}

class ShareUrlCopied extends ShareEvent {
  const ShareUrlCopied(this.palette);
  final ColorPalette palette;
}
