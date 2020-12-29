import '../../models/colors/colors_json.dart';

abstract class SavedState {}

class SavedEmptyState extends SavedState {}

class SavedErrorState extends SavedState {}

class SavedLoadingState extends SavedState {}

class SavedLoadedState extends SavedState {
  SavedLoadedState(this.colorsAI);
  final ColorsAI colorsAI;
}
