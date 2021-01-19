abstract class FabState {
  const FabState();
}

class FabDefaultState extends FabState {
  const FabDefaultState();
}

class FabErrorState extends FabState {
  const FabErrorState();
} //TODO: Handle this state.

class FabHideState extends FabState {}

class FabShowState extends FabState {}
