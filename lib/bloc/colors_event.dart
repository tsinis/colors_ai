import '../models/colors/colors_json.dart';

abstract class ColorsEvent {}

class ColorsGenEvent extends ColorsEvent {}

class ColorsReorderEvent extends ColorsEvent {
  ColorsReorderEvent(this.colors);
  final ColorsAI colors;
}
