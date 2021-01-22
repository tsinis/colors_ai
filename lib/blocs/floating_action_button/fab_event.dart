import 'package:equatable/equatable.dart';

abstract class FabEvent extends Equatable {
  const FabEvent();

  @override
  List<Object> get props => [];
}

class FabStarted extends FabEvent {
  const FabStarted();
}

class FabHided extends FabEvent {
  const FabHided();
}

class FabShowed extends FabEvent {
  const FabShowed();
}
