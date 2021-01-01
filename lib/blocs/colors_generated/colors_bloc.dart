import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/colors/colors_json.dart';
import '../../repositories/colors_repository.dart';
import 'colors_event.dart';
import 'colors_state.dart';

class ColorsBloc extends Bloc<ColorsEvent, ColorsState> {
  final ColorsRepository colorsRepository;
  ColorsBloc(this.colorsRepository) : super(ColorsEmptyState());

  @override
  Stream<ColorsState> mapEventToState(ColorsEvent event) async* {
    if (event is ColorsGenEvent) {
      yield ColorsLoadingState();
      try {
        final ColorsAI _loadedColorsList = await colorsRepository.getNewColors;
        yield ColorsLoadedState(_loadedColorsList);
        // ignore: avoid_catches_without_on_clauses
      } catch (_) {
        yield ColorsErrorState();
      }
    }
    if (event is ColorsReorderEvent) {
      try {
        yield ColorsLoadedState(event.colors);
        // ignore: avoid_catches_without_on_clauses
      } catch (_) {
        yield ColorsErrorState();
      }
    }
  }
}
