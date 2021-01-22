import 'dart:ui';

abstract class SaveEvent {
  const SaveEvent();
}

class SaveAdded extends SaveEvent {
  const SaveAdded({required this.colorsToSave});

  final List<Color> colorsToSave;
}

class SaveAllRemoved extends SaveEvent {
  const SaveAllRemoved();
}

class SaveOneRemoved extends SaveEvent {
  const SaveOneRemoved({required this.colorToRemoveIndex});
  final int colorToRemoveIndex;
}
