import '../../models/colors/colors_json.dart';

abstract class SavedEvent {}

class SavedExistingEvent extends SavedEvent {}

class SavedRemovingEvent extends SavedEvent {
  SavedRemovingEvent(this.colors);
  final ColorsAI colors;
}
