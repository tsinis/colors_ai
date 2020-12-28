part of 'colors_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ColorsJSON _$ColorsJSONFromJson(Map<String, dynamic> json) =>
    ColorsJSON((json[key] as List<dynamic>).map((e) => (e as List<dynamic>).map((e) => e as int).toList()).toList());

Map<String, dynamic> _$ColorsJSONToJson(ColorsJSON instance) => <String, dynamic>{key: instance.result};
