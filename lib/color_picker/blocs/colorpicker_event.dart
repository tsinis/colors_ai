import 'dart:ui' show Color;

import '../../core/constants.dart';

part 'colorpicker_event.freezed.dart';

@freezedWithoutJson
class ColorPickerEvent with _$ColorPickerEvent {
  const factory ColorPickerEvent.hided() = _ColorPickerHided;
  const factory ColorPickerEvent.showed() = _ColorPickerShowed;
  const factory ColorPickerEvent.copied(Color color) = _ColorPickerCopied;
}
