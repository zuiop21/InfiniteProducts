import 'package:json_annotation/json_annotation.dart';
part 'raw_meta.g.dart';

@JsonSerializable()
class RawMeta {
  RawMeta(
      {required this.createdAt,
      required this.updatedAt,
      required this.barcode,
      required this.qrCode});
  final DateTime createdAt;
  final DateTime updatedAt;
  final String barcode;
  final String qrCode;
  Map<String, dynamic> toJson() => _$RawMetaToJson(this);

  factory RawMeta.fromJson(Map<String, dynamic> json) =>
      _$RawMetaFromJson(json);
}
