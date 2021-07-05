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

class ColorsReorderSuccess extends ColorsState {
  const ColorsReorderSuccess(this.palette);
  final ColorPalette palette;
}

class ColorsLoadSuccess extends ColorsReorderSuccess {
  ColorsLoadSuccess(ColorPalette palette) : super(palette);
}
