part of 'colors_bloc.dart';

abstract class ColorsEvent extends Equatable {
  const ColorsEvent();

  @override
  List<Object> get props => [];
}

class ColorsGenerated extends ColorsEvent {
  const ColorsGenerated({required this.generateColorsForUi});

  final bool generateColorsForUi;
}

class ColorsStarted extends ColorsEvent {
  const ColorsStarted();
}

class ColorsRestored extends ColorsEvent {
  const ColorsRestored({required this.palette});

  final ColorPalette palette;
}

class ColorsChanged extends ColorsEvent {
  const ColorsChanged(this.newColor, this.colorIndex);

  final int colorIndex;
  final Color? newColor;
}

class ColorsReordered extends ColorsEvent {
  const ColorsReordered({required this.oldIndex, required this.newIndex});

  final int newIndex;
  final int oldIndex;
}
