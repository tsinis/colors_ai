part of 'colors_bloc.dart';

abstract class ColorsEvent extends Equatable {
  const ColorsEvent();
}

class ColorsGenerated extends ColorsEvent {
  @override
  List<Object?> get props => <Object?>[];

  const ColorsGenerated();
}

class ColorsStarted extends ColorsEvent {
  @override
  List<Object> get props => <Object>[];

  const ColorsStarted();
}

class ColorsRestored extends ColorsEvent {
  final ColorPalette palette;

  @override
  List<Object> get props => <ColorPalette>[palette];

  const ColorsRestored({required this.palette});
}

class ColorsChanged extends ColorsEvent {
  final int colorIndex;
  final Color? newColor;

  @override
  List<Object?> get props => <Object?>[colorIndex, newColor];

  const ColorsChanged(this.newColor, this.colorIndex);
}

class ColorsReordered extends ColorsEvent {
  final int newIndex;
  final int oldIndex;

  @override
  List<Object> get props => <int>[oldIndex, newIndex];

  const ColorsReordered({required this.oldIndex, required this.newIndex});
}
