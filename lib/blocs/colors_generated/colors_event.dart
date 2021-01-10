import 'dart:ui';

abstract class ColorsEvent {}

class ColorsGenEvent extends ColorsEvent {}

class ColorsInitalGenEvent extends ColorsEvent {}

class ColorsChangeEvent extends ColorsEvent {
  ColorsChangeEvent(this.newColor, this.colorIndex);
  final Color? newColor;
  final int colorIndex;
}

class ColorsReorderStartEvent extends ColorsEvent {}

class ColorsReorderEndEvent extends ColorsEvent {}

class ColorsReorderEvent extends ColorsEvent {
  ColorsReorderEvent({required this.oldIndex, required this.newIndex});
  final int oldIndex, newIndex;
}
