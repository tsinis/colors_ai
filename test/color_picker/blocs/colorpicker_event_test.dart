import 'dart:ui' show Color;

import 'package:colors_ai/color_picker/blocs/colorpicker_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../data.dart';

class ColorPickerEventTest extends ColorPickerEvent {
  const ColorPickerEventTest();
}

void main() {
  test('$ColorPickerEvent props', () {
    const ColorPickerEvent pickerEvent = ColorPickerEventTest();
    expect(pickerEvent.props.isEmpty, true);
  });

  test('$ColorPickerCopied props', () {
    const ColorPickerEvent pickerEvent = ColorPickerCopied(color);
    expect(pickerEvent.props, <Color>[color]);
  });
}
