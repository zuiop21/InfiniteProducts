// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'raw_meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RawMeta _$RawMetaFromJson(Map<String, dynamic> json) => RawMeta(
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      barcode: json['barcode'] as String,
      qrCode: json['qrCode'] as String,
    );

Map<String, dynamic> _$RawMetaToJson(RawMeta instance) => <String, dynamic>{
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'barcode': instance.barcode,
      'qrCode': instance.qrCode,
    };
