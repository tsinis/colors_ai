import 'dart:convert';
import 'dart:ui' show Color;

import 'package:http/http.dart' show Response;
import 'package:json_annotation/json_annotation.dart';

import '../../../../../core/models/color_palette/color_palette.dart';
import '../../../../interfaces/colors_from_api.dart';
import 'colormind_colors_converter.dart';

/// This allows the `ColormindColors` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'colormind_colors.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@ColormindColorsConverter()
@JsonSerializable(createToJson: false, checked: true)
class ColormindColors extends ColorsFromAPI {
  @JsonKey(name: 'result', required: true)
  final List<Color> colors;

  /// An annotation used to specify how a field is serialized.
  const ColormindColors({this.colors = const <Color>[]}) : super(colors);

  /// A necessary factory constructor for creating a new ColormindColors instance
  /// from a map. Pass the map to the generated `_$ColormindColorsFromJson()` constructor.
  /// The constructor is named after the source class, in this case, ColormindColors.
  factory ColormindColors.fromJson(Map<String, dynamic> json) => _$ColormindColorsFromJson(json);

  @override
  ColorPalette fromResponse(Response response) {
    final Map<String, dynamic> responseMap = jsonDecode(response.body) as Map<String, dynamic>;

    return ColormindColors.fromJson(responseMap).asPalette;
  }
}
