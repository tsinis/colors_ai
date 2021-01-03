import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/colors_repository.dart';
import 'colors_event.dart';
import 'colors_state.dart';

class ColorsBloc extends Bloc<ColorsEvent, ColorsState> {
  final ColorsRepository _colorsRepository;
  ColorsBloc(this._colorsRepository) : super(ColorsEmptyState());
  @override
  Stream<ColorsState> mapEventToState(ColorsEvent event) async* {
    if (event is ColorsGenEvent || event is ColorsInitalGenEvent) {
      if (event is ColorsInitalGenEvent) {
        yield ColorsLoadingState();
      }
      try {
        await _colorsRepository.getNewColors;
        yield ColorsLoadedState(_colorsRepository.colors);
        // ignore: avoid_catches_without_on_clauses
      } catch (_) {
        yield ColorsErrorState();
      }
    }
    if (event is ColorsReorderEvent) {
      try {
        _colorsRepository.swapColors(oldIndex: event.oldIndex, newIndex: event.newIndex);
        yield ColorsLoadedState(_colorsRepository.colors);
        // ignore: avoid_catches_without_on_clauses
      } catch (_) {
        yield ColorsErrorState();
      }
    }
  }
}
