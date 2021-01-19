abstract class ColorPickerState {
  const ColorPickerState();
}

class ColorPickerHiddenState extends ColorPickerState {
  const ColorPickerHiddenState();
}

class ColorPickerShowingState extends ColorPickerState {
  const ColorPickerShowingState();
}

//TODO! Handle error states.
class ColorPickerErrorState extends ColorPickerState {
  const ColorPickerErrorState();
}
