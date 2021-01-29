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
    if (event is ColorsStarted) {
      yield const ColorsLoadInProgress();
      _colorsRepository.initColors;
      yield ColorsLoadSuccess(_colorsRepository.colors.list);
    } else if (event is ColorsChanged) {
      if (event.newColor != null) {
        _colorsRepository.changeColor(event.newColor!, event.colorIndex);
      }
      yield ColorsLoadSuccess(_colorsRepository.colors.list);
    } else if (event is ColorsGenerated) {
      final bool isGenerated = await _colorsRepository.getNewColors;
      if (isGenerated) {
        try {
          yield ColorsLoadSuccess(_colorsRepository.colors.list);
        } catch (_) {
          yield const ColorsFailure();
        }
      } else {
        yield const ColorsFailure();
      }
    } else if (event is ColorsReordered) {
      try {
        _colorsRepository.swapColors(oldIndex: event.oldIndex, newIndex: event.newIndex);
        yield ColorsLoadSuccess(_colorsRepository.colors.list);
      } catch (_) {
        yield const ColorsFailure();
      }
    } else if (event is ColorsRestored) {
      try {
        _colorsRepository.fromFavorites(event.colorsToRestore);
        yield ColorsLoadSuccess(_colorsRepository.colors.list);
      } catch (_) {
        yield const ColorsFailure();
      }
    }
  }
}
