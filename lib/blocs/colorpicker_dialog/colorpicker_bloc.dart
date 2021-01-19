import 'package:flutter_bloc/flutter_bloc.dart';

import 'colorpicker_event.dart';
import 'colorpicker_state.dart';

class ColorPickerBLoc extends Bloc<ColorPickerEvent, ColorPickerState> {
  ColorPickerBLoc() : super(const ColorPickerHiddenState());

  @override
  Stream<ColorPickerState> mapEventToState(ColorPickerEvent event) async* {
    if (event is ShowColorPicker) {
      yield const ColorPickerShowingState();
    } else {
      yield const ColorPickerHiddenState();
    }
  }
}
