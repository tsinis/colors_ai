import 'dart:ui' show Color;

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/services/clipboards.dart';

part 'colorpicker_event.dart';
part 'colorpicker_state.dart';

class ColorPickerBLoc extends Bloc<ColorPickerEvent, ColorPickerState> {
  ColorPickerBLoc({this.clipboard = const Clipboards()}) : super(const ColorPickerCloseInitial());

  final Clipboards clipboard;

  @override
  Stream<ColorPickerState> mapEventToState(ColorPickerEvent event) async* {
    if (event is ColorPickerCopied) {
      await clipboard.copyColor(event.color);
      yield const ColorPickerCloseInitial();
    } else if (event is ColorPickerShowed) {
      yield const ColorPickerOpenInitial();
    } else {
      yield const ColorPickerCloseInitial();
    }
  }
}
