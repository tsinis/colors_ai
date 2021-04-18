part of 'colorpicker_bloc.dart';

abstract class ColorPickerState extends Equatable {
  const ColorPickerState();

  @override
  List<Object> get props => [];
}

class ColorPickerCloseInitial extends ColorPickerState {
  const ColorPickerCloseInitial();
}

class ColorPickerOpenInitial extends ColorPickerState {
  const ColorPickerOpenInitial();
}

class ColorPickerFailure extends ColorPickerState {
  const ColorPickerFailure();
}

class ColorPickerCopySuccess extends ColorPickerState {
  const ColorPickerCopySuccess({required this.copiedColor});
  final String copiedColor;
}
