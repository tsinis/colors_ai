import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/colors_repository.dart';
import 'colors_event.dart';
import 'colors_state.dart';

// ignore_for_file: avoid_catches_without_on_clauses

class ColorsBloc extends Bloc<ColorsEvent, ColorsState> {
  ColorsBloc(this._colorsRepository) : super(const ColorsInitial());

  final ColorsRepository _colorsRepository;

  @override
  Stream<ColorsState> mapEventToState(ColorsEvent event) async* {
    if (event is ColorsChanged) {
      if (event.newColor != null) {
        _colorsRepository.changeColor(event.newColor!, event.colorIndex);
      }
      yield ColorsLoadSuccess(_colorsRepository.colors.list);
    }
    if (event is ColorsGenerated || event is ColorsStarted) {
      if (event is ColorsStarted) {
        yield const ColorsLoadInProgress();
      }
      try {
        await _colorsRepository.getNewColors;
        yield ColorsLoadSuccess(_colorsRepository.colors.list);
      } catch (_) {
        yield const ColorsFailure();
      }
    }
    if (event is ColorsReordered) {
      try {
        _colorsRepository.swapColors(oldIndex: event.oldIndex, newIndex: event.newIndex);
        yield ColorsLoadSuccess(_colorsRepository.colors.list);
      } catch (_) {
        yield const ColorsFailure();
      }
    }
  }
}
