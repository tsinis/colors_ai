abstract class ColorPickerEvent {
  const ColorPickerEvent();
}

class ShowColorPicker extends ColorPickerEvent {
  const ShowColorPicker();
}

class VisibleColorPicker extends ColorPickerEvent {
  const VisibleColorPicker();
}
