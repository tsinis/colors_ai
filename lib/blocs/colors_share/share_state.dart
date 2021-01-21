part of 'share_bloc.dart';

abstract class ShareState extends Equatable {
  const ShareState();

  @override
  List<Object> get props => [];
}

class ShareErrorState extends ShareState {
  const ShareErrorState();
}

class ShareCurrentColorsState extends ShareState {}

class ShareSavedColorsState extends ShareState {}
