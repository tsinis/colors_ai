part of 'colors_bloc.dart';

abstract class ColorsEvent extends Equatable {
  const ColorsEvent();
}

class ColorsGenerated extends ColorsEvent {
  final bool generateColorsForUi;

  @override
  List<Object> get props => [generateColorsForUi];

  const ColorsGenerated({required this.generateColorsForUi});
}

class ColorsStarted extends ColorsEvent {
  @override
  List<Object> get props => [];

  const ColorsStarted();
}

class ColorsRestored extends ColorsEvent {
  final ColorPalette palette;

  @override
  List<Object> get props => [palette];

  const ColorsRestored({required this.palette});
}

class ColorsChanged extends ColorsEvent {
  final int colorIndex;
  final Color? newColor;

  @override
  List<Object?> get props => [colorIndex, newColor];

  const ColorsChanged(this.newColor, this.colorIndex);
}

class ColorsReordered extends ColorsEvent {
  final int newIndex;
  final int oldIndex;

  @override
  List<Object> get props => [oldIndex, newIndex];

  const ColorsReordered({required this.oldIndex, required this.newIndex});
}
