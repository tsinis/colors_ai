part of 'colorpicker_bloc.dart';

abstract class ColorPickerEvent extends Equatable {
  @override
  List<Object> get props => [];

  const ColorPickerEvent();
}

class ColorPickerShowed extends ColorPickerEvent {
  const ColorPickerShowed();
}

class ColorPickerHided extends ColorPickerEvent {
  const ColorPickerHided();
}

class ColorPickerCopied extends ColorPickerEvent {
  final Color color;

  @override
  List<Object> get props => [color];

  const ColorPickerCopied(this.color);
}
