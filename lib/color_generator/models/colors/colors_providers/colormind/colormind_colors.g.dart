// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'colormind_colors.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ColormindColors _$ColormindColorsFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ColormindColors',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['result'],
        );
        final val = ColormindColors(
          colors: $checkedConvert(
              'result',
              (v) => v == null
                  ? const <Color>[]
                  : const ColormindColorsConverter().fromJson(v as List)),
        );
        return val;
      },
      fieldKeyMap: const {'colors': 'result'},
    );
