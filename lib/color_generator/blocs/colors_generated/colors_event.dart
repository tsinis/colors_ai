part of 'colors_bloc.dart';

abstract class ColorsEvent extends Equatable {
  @override
  List<Object> get props => [];

  const ColorsEvent();
}

class ColorsGenerated extends ColorsEvent {
  final bool generateColorsForUi;

  const ColorsGenerated({required this.generateColorsForUi});
}

class ColorsStarted extends ColorsEvent {
  const ColorsStarted();
}

class ColorsRestored extends ColorsEvent {
  final ColorPalette palette;

  const ColorsRestored({required this.palette});
}

class ColorsChanged extends ColorsEvent {
  final int colorIndex;
  final Color? newColor;

  const ColorsChanged(this.newColor, this.colorIndex);
}

class ColorsReordered extends ColorsEvent {
  final int newIndex;
  final int oldIndex;

  const ColorsReordered({required this.oldIndex, required this.newIndex});
}
