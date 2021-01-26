part of 'share_bloc.dart';

abstract class ShareState extends Equatable {
  const ShareState();

  @override
  List<Object> get props => [];
}

class ShareFailure extends ShareState {
  const ShareFailure();
}

class ShareCurrentInitial extends ShareState {
  const ShareCurrentInitial();
}

class ShareFavoritesInitial extends ShareState {
  const ShareFavoritesInitial();
}
