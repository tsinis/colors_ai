import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'constants.dart';

/// This allows the `ColorsJSON` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'colors_json.g.dart';

ColorsJSON colorsFromJson(String dataFromAPI) =>
    // ignore: avoid_as
    ColorsJSON.fromJson(json.decode(dataFromAPI) as Map<String, dynamic>);

String colorsToJson(ColorsJSON colors) => json.encode(colors.toJson());

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class ColorsJSON {
  const ColorsJSON(this.result);

  final List<List<int>> result;

  /// A necessary factory constructor for creating a new ColorsJSON instance
  /// from a map. Pass the map to the generated `_$ColorsJSONFromJson()` constructor.
  /// The constructor is named after the source class, in this case, ColorsJSON.
  factory ColorsJSON.fromJson(Map<String, dynamic> json) => _$ColorsJSONFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$ColorsJSONToJson`.
  Map<String, dynamic> toJson() => _$ColorsJSONToJson(this);
}
