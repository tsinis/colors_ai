import 'dart:ui';

abstract class ColorsEvent {
  const ColorsEvent();
}

class ColorsGenEvent extends ColorsEvent {
  const ColorsGenEvent();
}

class ColorsInitalGenEvent extends ColorsEvent {
  const ColorsInitalGenEvent();
}

class ColorsChangeEvent extends ColorsEvent {
  const ColorsChangeEvent(this.newColor, this.colorIndex);
  final Color? newColor;
  final int colorIndex;
}

class ColorsReorderEvent extends ColorsEvent {
  const ColorsReorderEvent({required this.oldIndex, required this.newIndex});
  final int oldIndex, newIndex;
}
