// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'raw_dimension.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RawDimension _$RawDimensionFromJson(Map<String, dynamic> json) => RawDimension(
      width: (json['width'] as num).toDouble(),
      height: (json['height'] as num).toDouble(),
      depth: (json['depth'] as num).toDouble(),
    );

Map<String, dynamic> _$RawDimensionToJson(RawDimension instance) =>
    <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
      'depth': instance.depth,
    };
