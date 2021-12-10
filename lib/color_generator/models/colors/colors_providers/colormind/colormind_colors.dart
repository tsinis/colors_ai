import 'dart:convert';
import 'dart:ui' show Color;

import 'package:http/http.dart' show Response;
import 'package:json_annotation/json_annotation.dart';

import '../../../../../core/extensions/color_palette_extension.dart';
import '../../../../../core/models/color_palette/color_palette.dart';
import '../../../../interfaces/colors_from_api.dart';
import 'colormind_colors_converter.dart';

/// This allows the `ColormindColors` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'colormind_colors.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable(createToJson: false)
@ColormindColorsConverter()
class ColormindColors implements ColorsFromAPI {
  @override
  @JsonKey(name: 'result', required: true)
  final List<Color> list;

  /// An annotation used to specify how a field is serialized.
  const ColormindColors({this.list = const []});

  /// A necessary factory constructor for creating a new ColormindColors instance
  /// from a map. Pass the map to the generated `_$ColorsAIFromJson()` constructor.
  /// The constructor is named after the source class, in this case, ColormindColors.
  factory ColormindColors.fromJson(Map<String, dynamic> json) => _$ColormindColorsFromJson(json);

  @override
  void add(Color color) => list.add(color);

  @override
  void addAll(List<Color> newColors) => list
    ..clear()
    ..addAll(newColors);

  @override
  void fromPalette(ColorPalette palette) {
    list.clear();
    palette.colors.forEach(list.add);
  }

  @override
  void swap({required int oldIndex, required int newIndex}) {
    final Color swapedColor = list[oldIndex];
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
  ColorPalette toPalette() => list.toPalette();

  @override
  void change(int colorIndex, Color newColor) => list[colorIndex] = newColor;

  @override
  ColorPalette fromResponse(Response response) {
    final Map<String, dynamic> responseMap = jsonDecode(response.body) as Map<String, dynamic>;
    final ColormindColors colors = ColormindColors.fromJson(responseMap);

    return colors.toPalette();
  }
}
