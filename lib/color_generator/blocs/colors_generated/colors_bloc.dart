// ignore_for_file: avoid_catches_without_on_clauses

import 'dart:ui' show Color;

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/models/color_palette/color_palette.dart';
import '../../../core/repository/colors_repository.dart';

part 'colors_event.dart';
part 'colors_state.dart';

class ColorsBloc extends Bloc<ColorsEvent, ColorsState> {
  final ColorsRepository _colorsRepository;

  ColorsBloc(this._colorsRepository) : super(const ColorsInitial());

  @override
  Stream<ColorsState> mapEventToState(ColorsEvent event) async* {
    if (event is ColorsStarted) {
      yield const ColorsLoadInProgress();
      yield ColorsLoadSuccess(_colorsRepository.palette);
    } else if (event is ColorsChanged) {
      final Color newColor = event.newColor;
      _colorsRepository.changeColor(newColor, event.colorIndex);
      yield ColorsChangeSuccess(_colorsRepository.palette);
    } else if (event is ColorsGenerated) {
      yield ColorsLoadStarted(_colorsRepository.palette);
      final bool isGenerated = await _colorsRepository.getNewColors();
      if (isGenerated) {
        try {
          yield ColorsLoadSuccess(_colorsRepository.palette);
        } catch (_) {
          yield const ColorsFailure();
        }
      } else {
        yield const ColorsFailure();
      }
    } else if (event is ColorsReordered) {
      try {
        _colorsRepository.swapColors(oldIndex: event.oldIndex, newIndex: event.newIndex);
        yield ColorsChangeSuccess(_colorsRepository.palette);
      } catch (_) {
        yield const ColorsFailure();
      }
    } else if (event is ColorsRestored) {
      try {
        _colorsRepository.fromFavorites(event.palette);
        yield ColorsLoadSuccess(_colorsRepository.palette);
      } catch (_) {
        yield const ColorsFailure();
      }
    }
  }
}
