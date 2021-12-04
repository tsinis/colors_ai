// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'colors_ai.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ColorsAI _$ColorsAIFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['result'],
  );
  return ColorsAI(
    list: (json['result'] as List<dynamic>?)
            ?.map((e) => (e as List<dynamic>).map((e) => e as int).toList())
            .toList() ??
        const [],
  );
}
