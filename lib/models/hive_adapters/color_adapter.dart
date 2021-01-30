import 'dart:ui' show Color;
// ignore: import_of_legacy_library_into_null_safe
import 'package:hive/hive.dart';

class ColorAdapter extends TypeAdapter<Color> {
  @override
  Color read(BinaryReader reader) {
    final colorValue = reader.readInt();
    return Color(colorValue);
  }

  @override
  void write(BinaryWriter writer, Color obj) {
    writer.writeInt(obj.value);
  }

  @override
  int get typeId => 0;
}
