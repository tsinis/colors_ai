abstract class ColorsEvent {}

class ColorsGenEvent extends ColorsEvent {}

class ColorsInitalGenEvent extends ColorsEvent {}

class ColorsReorderEvent extends ColorsEvent {
  final int oldIndex, newIndex;

  ColorsReorderEvent({required this.oldIndex, required this.newIndex});
}
