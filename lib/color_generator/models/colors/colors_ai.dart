import 'dart:ui' show Color;

import 'package:json_annotation/json_annotation.dart';

import '../../../core/extensions/color_extensions.dart';
import '../../../core/extensions/color_palette_extension.dart';
import '../../../core/extensions/int_color_extensions.dart';
import '../../../core/models/color_palette/color_palette.dart';
import '../../../core/models/typedef_aliases/int_rgb_color.dart';
import '../../interfaces/color_palette_interface.dart';
import '../../interfaces/manipulate_list_interface.dart';

/// This allows the `ColorsAI` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'colors_ai.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable(createToJson: false)
class ColorsAI implements ManipulateListInterface, ColorPaletteInterface {
  @override
  @JsonKey(name: 'result', required: true)
  final List<IntRGBColor> list;

  /// An annotation used to specify how a field is serialized.
  ColorsAI({this.list = const []});

  /// A necessary factory constructor for creating a new ColorsAI instance
  /// from a map. Pass the map to the generated `_$ColorsAIFromJson()` constructor.
  /// The constructor is named after the source class, in this case, ColorsAI.
  factory ColorsAI.fromJson(Map<String, dynamic> json) => _$ColorsAIFromJson(json);

  @override
  void add(covariant IntRGBColor color) => list.add(color);

  @override
  void addAll(covariant List<IntRGBColor> newColors) => list
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
  void swap({required int oldIndex, required int newIndex}) {
    final IntRGBColor swapedColor = list[oldIndex];
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
  ColorPalette toPalette() => list.map((intColor) => intColor.toColor()).toList(growable: false).toPalette();

  void change(int colorIndex, Color newColor) => list[colorIndex] = newColor.toListInt();
}
