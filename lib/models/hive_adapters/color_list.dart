import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

part 'color_list.g.dart';

@HiveType(typeId: 0)
class ColorList extends HiveObject {
  @HiveField(0)
  List<Color> list = [];
}
