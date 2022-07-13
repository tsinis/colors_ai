part of 'fab_bloc.dart';

abstract class FabEvent extends Equatable {
  @override
  List<Object> get props => <Object>[];

  const FabEvent();
}

class FabHided extends FabEvent {
  const FabHided();
}

class FabShowed extends FabEvent {
  const FabShowed();
}
