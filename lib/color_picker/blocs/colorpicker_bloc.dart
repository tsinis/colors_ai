import 'dart:ui' show Color;

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/services/clipboard.dart';

part 'colorpicker_event.dart';
part 'colorpicker_state.dart';

class ColorPickerBloc extends Bloc<ColorPickerEvent, ColorPickerState> {
  final ClipBoard _clipboard;

  ColorPickerBloc({ClipBoard clipboard = const ClipBoard()})
      : _clipboard = clipboard,
        super(const ColorPickerCloseInitial());

  @override
  Stream<ColorPickerState> mapEventToState(ColorPickerEvent event) async* {
    if (event is ColorPickerCopied) {
      try {
        await _clipboard.copyColor(event.color);
        // ignore: avoid_catches_without_on_clauses
      } catch (_) {
        yield const ColorPickerFailure();
      } finally {
        yield const ColorPickerCloseInitial();
      }
    } else if (event is ColorPickerShowed) {
      yield const ColorPickerOpenInitial();
    } else {
      yield const ColorPickerCloseInitial();
    }
  }
}
