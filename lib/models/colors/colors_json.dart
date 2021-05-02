import 'dart:ui' show Color;

import 'package:json_annotation/json_annotation.dart';

import '../../extensions/color_to_list_int.dart';
import '../../extensions/list_color_to_palette.dart';
import '../../extensions/list_int_to_color.dart';
import '../../interfaces/color_palette.dart';
import '../../interfaces/manipulate_list.dart';
import '../hive/color_palette.dart';
import 'constants.dart';

/// This allows the `ColorsAI` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'colors_json.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable(createToJson: false)
class ColorsAI implements ManipulateListInterface, ColorPaletteInterface {
  ColorsAI({this.list = const []});

  /// An annotation used to specify how a field is serialized.
  @override
  @JsonKey(name: key, required: true)
  final List<List<int>> list;

  @override
  void change(int colorIndex, [Color? newColor]) => list[colorIndex] = newColor!.toListInt();

  @override
  void swap({required int oldIndex, required int newIndex}) {
    final List<int> swapedColor = list[oldIndex];
    if (newIndex >= list.length) {
      list
        ..removeAt(oldIndex)
        ..add(swapedColor);
    } else {
      list
        ..removeAt(oldIndex)
        ..insert(newIndex, swapedColor);
    }
  }

  @override
  void add(covariant List<int> color) => list.add(color);

  @override
  void addAll(covariant List<List<int>> newColors) => list
    ..clear()
    ..addAll(newColors);

  @override
  void fromPalette(ColorPalette palette) {
    list.clear();
    for (final Color color in palette.colors) {
      list.add(color.toListInt());
    }
  }

  @override
  ColorPalette get asPalette {
    final List<Color> colorsList = [];
    for (final List<int> colorAsListInt in list) {
      colorsList.add(colorAsListInt.toColor());
    }
    return colorsList.toPalette();
  }

  /// A necessary factory constructor for creating a new ColorsAI instance
  /// from a map. Pass the map to the generated `_$ColorsAIFromJson()` constructor.
  /// The constructor is named after the source class, in this case, ColorsAI.
  factory ColorsAI.fromJson(Map<String, dynamic> json) => _$ColorsAIFromJson(json);
}
