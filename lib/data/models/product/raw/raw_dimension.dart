import 'package:json_annotation/json_annotation.dart';
part 'raw_dimension.g.dart';

@JsonSerializable()
class RawDimension {
  RawDimension(
      {required this.width, required this.height, required this.depth});
  final double width;
  final double height;
  final double depth;
  Map<String, dynamic> toJson() => _$RawDimensionToJson(this);

  factory RawDimension.fromJson(Map<String, dynamic> json) =>
      _$RawDimensionFromJson(json);
}
