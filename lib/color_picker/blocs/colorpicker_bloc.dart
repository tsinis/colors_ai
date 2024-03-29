import 'dart:ui';

import 'package:stream_bloc/stream_bloc.dart';

import '../../core/services/clipboard.dart';
import 'colorpicker_event.dart';
import 'colorpicker_state.dart';

export 'colorpicker_event.dart';
export 'colorpicker_state.dart';

class ColorPickerBloc extends StreamBloc<ColorPickerEvent, ColorPickerState> {
  final ClipBoard _clipboard;

  ColorPickerBloc({ClipBoard clipboard = const ClipBoard()})
      : _clipboard = clipboard,
        super(const ColorPickerState.close());

  @override
  Stream<ColorPickerState> mapEventToStates(ColorPickerEvent event) => event.when(
        copied: (Color color) async* {
          try {
            await _clipboard.copyColor(color);
          } catch (_) {
            yield const ColorPickerState.failure();
          } finally {
            yield const ColorPickerState.close();
          }
        },
        showed: () async* {
          yield const ColorPickerState.open();
        },
        hided: () async* {
          yield const ColorPickerState.close();
        },
      );
}
