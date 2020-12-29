part of 'colors_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ColorsAI _$ColorsAIFromJson(Map<String, dynamic> json) => ColorsAI(
    list: (json[key] as List<dynamic>)
        .map((rgbList) => (rgbList as List<dynamic>).map((rgb) => rgb as int).toList())
        .toList());

Map<String, dynamic> _$ColorsAIToJson(ColorsAI colors) => <String, dynamic>{key: colors.list};
