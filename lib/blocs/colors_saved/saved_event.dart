import 'package:flutter/cupertino.dart';

abstract class SavedEvent {
  const SavedEvent();
}

class SavedAddEvent extends SavedEvent {
  const SavedAddEvent({required this.colorsToSave});

  final List<Color> colorsToSave;
}

class SavedRemoveAllEvent extends SavedEvent {
  const SavedRemoveAllEvent();
}

class SavedRemoveEvent extends SavedEvent {
  SavedRemoveEvent({required this.colorToRemoveIndex});

  final int colorToRemoveIndex;
}
