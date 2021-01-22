abstract class FabState {
  const FabState();
}

class FabInitial extends FabState {
  const FabInitial();
}

class FabFailure extends FabState {
  const FabFailure();
}

class FabHideInitial extends FabState {}

class FabShowInitial extends FabState {}
