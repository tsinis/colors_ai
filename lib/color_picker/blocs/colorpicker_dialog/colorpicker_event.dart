part of 'colorpicker_bloc.dart';

abstract class ColorPickerEvent extends Equatable {
  const ColorPickerEvent();

  @override
  List<Object> get props => [];
}

class ColorPickerShowed extends ColorPickerEvent {
  const ColorPickerShowed();
}

class ColorPickerHided extends ColorPickerEvent {
  const ColorPickerHided();
}

class ColorPickerCopied extends ColorPickerEvent {
  const ColorPickerCopied(this.color);
  final Color color;
}
