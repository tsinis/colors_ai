import 'package:flutter/cupertino.dart';

abstract class SavedEvent {
  const SavedEvent();
}

class SavedExistingEvent extends SavedEvent {}

class SavedAddEvent extends SavedEvent {
  const SavedAddEvent({required this.colorsToSave});
  final List<Color> colorsToSave;
}

class SavedRemovingEvent extends SavedEvent {
  final int colorToRemoveIndex;

  SavedRemovingEvent({required this.colorToRemoveIndex});
}
