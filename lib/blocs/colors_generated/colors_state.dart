import '../../models/colors/colors_json.dart';

abstract class ColorsState {}

class ColorsEmptyState extends ColorsState {}

class ColorsErrorState extends ColorsState {}

class ColorsLoadingState extends ColorsState {}

class ColorsLoadedState extends ColorsState {
  ColorsLoadedState(this.colorsAI);
  final ColorsAI colorsAI;
}
