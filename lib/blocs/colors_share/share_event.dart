part of 'share_bloc.dart';

abstract class ShareEvent extends Equatable {
  const ShareEvent();

  @override
  List<Object> get props => [];
}

class ShareUrlEvent extends ShareEvent {
  const ShareUrlEvent({required this.currentColors});
  final List<Color> currentColors;
}

class CopyUrlEvent extends ShareEvent {
  const CopyUrlEvent({required this.currentColors});
  final List<Color> currentColors;
}
