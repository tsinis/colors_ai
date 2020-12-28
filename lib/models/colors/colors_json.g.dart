part of 'colors_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ColorsAI _$ColorsAIFromJson(Map<String, dynamic> json) => ColorsAI(
    result: (json[key] as List<dynamic>).map((e) => (e as List<dynamic>).map((e) => e as int).toList()).toList());

Map<String, dynamic> _$ColorsAIToJson(ColorsAI instance) => <String, dynamic>{key: instance.result};
