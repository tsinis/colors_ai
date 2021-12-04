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

class ColorsChangeSuccess extends ColorsState {
  final ColorPalette palette;

  const ColorsChangeSuccess(this.palette);
}

class ColorsLoadSuccess extends ColorsChangeSuccess {
  ColorsLoadSuccess(ColorPalette palette) : super(palette);
}

class ColorsLoadStarted extends ColorsChangeSuccess {
  ColorsLoadStarted(ColorPalette palette) : super(palette);
}
