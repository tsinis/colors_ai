// ignore_for_file: avoid_catches_without_on_clauses

import 'dart:ui' show Color;

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/hive/color_palette.dart';
import '../../repositories/colors_repository.dart';

part 'colors_event.dart';
part 'colors_state.dart';

class ColorsBloc extends Bloc<ColorsEvent, ColorsState> {
  ColorsBloc(this._colorsRepository) : super(const ColorsInitial());

  final ColorsRepository _colorsRepository;

  @override
  Stream<ColorsState> mapEventToState(ColorsEvent event) async* {
    if (event is ColorsStarted) {
      yield const ColorsLoadInProgress();
      _colorsRepository.initColors();
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
        _colorsRepository.fromFavorites(event.palette);
        yield ColorsLoadSuccess(_colorsRepository.colors.list);
      } catch (_) {
        yield const ColorsFailure();
      }
    }
  }
}
