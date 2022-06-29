import '../../core/constants.dart';

part 'colorpicker_state.freezed.dart';

@freezedWithoutJson
class ColorPickerState with _$ColorPickerState {
  const factory ColorPickerState.close() = _ColorPickerClose;
  const factory ColorPickerState.open() = _ColorPickerOpen;
  const factory ColorPickerState.failure() = _ColorPickerFailure;
}
