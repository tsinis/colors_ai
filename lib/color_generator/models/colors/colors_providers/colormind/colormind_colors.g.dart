// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'colormind_colors.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ColormindColors _$ColormindColorsFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['result'],
  );
  return ColormindColors(
    list: json['result'] == null
        ? const []
        : const ColormindColorsConverter().fromJson(json['result'] as List),
  );
}
