import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/colors_repository.dart';
import 'colors_event.dart';
import 'colors_state.dart';

// ignore_for_file: avoid_catches_without_on_clauses

class ColorsBloc extends Bloc<ColorsEvent, ColorsState> {
  final ColorsRepository _colorsRepository;
  ColorsBloc(this._colorsRepository) : super(const ColorsEmptyState());
  @override
  Stream<ColorsState> mapEventToState(ColorsEvent event) async* {
    if (event is ColorsChangeEvent) {
      if (event.newColor != null) {
        _colorsRepository.changeColor(event.newColor!, event.colorIndex);
      }
      yield ColorsLoadedState(_colorsRepository.colors);
    }
    if (event is ColorsGenEvent || event is ColorsInitalGenEvent) {
      if (event is ColorsInitalGenEvent) {
        yield const ColorsLoadingState();
      }
      try {
        await _colorsRepository.getNewColors;
        yield ColorsLoadedState(_colorsRepository.colors);
      } catch (_) {
        yield const ColorsErrorState();
      }
    }
    if (event is ColorsReorderEvent) {
      try {
        _colorsRepository.swapColors(oldIndex: event.oldIndex, newIndex: event.newIndex);
        yield ColorsLoadedState(_colorsRepository.colors);
      } catch (_) {
        yield const ColorsErrorState();
      }
    }
  }
}
