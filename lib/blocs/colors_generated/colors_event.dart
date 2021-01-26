import 'dart:ui';

import 'package:equatable/equatable.dart';

abstract class ColorsEvent extends Equatable {
  const ColorsEvent();

  @override
  List<Object> get props => [];
}

class ColorsGenerated extends ColorsEvent {
  const ColorsGenerated();
}

class ColorsStarted extends ColorsEvent {
  const ColorsStarted();
}

class ColorsRestored extends ColorsEvent {
  const ColorsRestored({required this.colorsToRestore});

  final List<Color> colorsToRestore;
}

class ColorsChanged extends ColorsEvent {
  const ColorsChanged(this.newColor, this.colorIndex);
  final Color? newColor;
  final int colorIndex;
}

class ColorsReordered extends ColorsEvent {
  const ColorsReordered({required this.oldIndex, required this.newIndex});
  final int oldIndex, newIndex;
}
