part of 'share_bloc.dart';

abstract class ShareEvent extends Equatable {
  const ShareEvent();

  @override
  List<Object> get props => [];
}

class ShareUrlCShared extends ShareEvent {
  const ShareUrlCShared({required this.currentColors});
  final List<Color> currentColors;
}

class ShareUrlCopied extends ShareEvent {
  const ShareUrlCopied({required this.currentColors});
  final List<Color> currentColors;
}
