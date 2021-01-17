import '../../models/colors/colors_json.dart';

abstract class ColorsState {
  const ColorsState();
}

class ColorsEmptyState extends ColorsState {
  const ColorsEmptyState();
}

class ColorsErrorState extends ColorsState {
  const ColorsErrorState();
}

class ColorsLoadingState extends ColorsState {
  const ColorsLoadingState();
}

class ColorsLoadedState extends ColorsState {
  const ColorsLoadedState(this.colorsAI);
  final ColorsAI colorsAI;
}
