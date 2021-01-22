import 'package:equatable/equatable.dart';

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
