import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'constants.dart';

/// This allows the `ColorsAI` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'colors_json.g.dart';

ColorsAI colorsFromJson(String dataFromAPI) =>
    // ignore: avoid_as
    ColorsAI.fromJson(json.decode(dataFromAPI) as Map<String, dynamic>);

String colorsToJson(ColorsAI colors) => json.encode(colors.toJson());

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class ColorsAI {
  const ColorsAI({this.result = const []});

  final List<List<int>> result;

  /// A necessary factory constructor for creating a new ColorsAI instance
  /// from a map. Pass the map to the generated `_$ColorsAIFromJson()` constructor.
  /// The constructor is named after the source class, in this case, ColorsAI.
  factory ColorsAI.fromJson(Map<String, dynamic> json) => _$ColorsAIFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$ColorsAIToJson`.
  Map<String, dynamic> toJson() => _$ColorsAIToJson(this);
}
