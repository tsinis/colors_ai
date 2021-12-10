import 'dart:ui' show Color;

import 'package:hive/hive.dart';

class ColorAdapter extends TypeAdapter<Color> {
  @override
  int get typeId => 200;

  @override
  Color read(BinaryReader reader) => Color(reader.readInt());

  @override
  void write(BinaryWriter writer, Color obj) => writer.writeInt(obj.value);
}
