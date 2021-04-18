// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'color_palette.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ColorPaletteAdapter extends TypeAdapter<ColorPalette> {
  @override
  final int typeId = 0;

  @override
  ColorPalette read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ColorPalette(
      colors: (fields[0] as List).cast<Color>(),
    );
  }

  @override
  void write(BinaryWriter writer, ColorPalette obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.colors);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ColorPaletteAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}
