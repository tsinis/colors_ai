part of 'colors_bloc.dart';

abstract class ColorsState {
  const ColorsState();
}

class ColorsInitial extends ColorsState {
  const ColorsInitial();
}

class ColorsFailure extends ColorsState {
  const ColorsFailure();
}

class ColorsLoadInProgress extends ColorsState {
  const ColorsLoadInProgress();
}

class ColorsLoadSuccess extends ColorsState {
  const ColorsLoadSuccess(this.colorsAI);
  final List<List<int>> colorsAI;
}
