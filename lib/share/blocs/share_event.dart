part of 'share_bloc.dart';

abstract class ShareEvent extends Equatable {
  const ShareEvent();
}

class ShareUrlProviderSelected extends ShareEvent {
  final ColorsUrlProvider? urlProvider;

  @override
  List<ColorsUrlProvider?> get props => <ColorsUrlProvider?>[urlProvider];

  const ShareUrlProviderSelected({required this.urlProvider});
}

class ShareStarted extends ShareEvent {
  @override
  List<Object?> get props => <Object?>[];

  const ShareStarted();
}

class ShareUrlShared extends ShareEvent {
  final ColorPalette palette;

  @override
  List<ColorPalette> get props => <ColorPalette>[palette];

  const ShareUrlShared(this.palette);
}

class ShareUrlCopied extends ShareEvent {
  final ColorPalette palette;

  @override
  List<ColorPalette> get props => <ColorPalette>[palette];

  const ShareUrlCopied(this.palette);
}

class ShareFileShared extends ShareEvent {
  final ColorPalette palette;

  @override
  List<ColorPalette> get props => <ColorPalette>[palette];

  const ShareFileShared(this.palette);
}

class ShareFileCopied extends ShareEvent {
  final ColorPalette palette;

  @override
  List<ColorPalette> get props => <ColorPalette>[palette];

  const ShareFileCopied(this.palette);
}

class ShareFormatSelected extends ShareEvent {
  final FileFormat? format;

  @override
  List<FileFormat?> get props => <FileFormat?>[format];

  const ShareFormatSelected({required this.format});
}
