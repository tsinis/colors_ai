part of 'colorpicker_bloc.dart';

abstract class ColorPickerState extends Equatable {
  @override
  List<Object> get props => <Object>[];

  const ColorPickerState();
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
