import 'dart:ui' show Color;

import 'package:equatable/equatable.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../services/clipboard.dart';

part 'colorpicker_event.dart';
part 'colorpicker_state.dart';

class ColorPickerBLoc extends Bloc<ColorPickerEvent, ColorPickerState> {
  ColorPickerBLoc() : super(const ColorPickerCloseInitial());

  static const Clipboards _clipboard = Clipboards();

  @override
  Stream<ColorPickerState> mapEventToState(ColorPickerEvent event) async* {
    if (event is ColorPickerCopied) {
      final String colorAsHexString = await _clipboard.copyColor(event.color);
      yield ColorPickerCopySuccess(copiedColor: colorAsHexString);
      yield const ColorPickerCloseInitial();
    } else if (event is ColorPickerShowed) {
      yield const ColorPickerOpenInitial();
    } else {
      yield const ColorPickerCloseInitial();
    }
  }
}
