import 'package:json_annotation/json_annotation.dart';
import 'package:infinite_products/data/models/product/raw/raw_dimension.dart';
import 'package:infinite_products/data/models/product/raw/raw_meta.dart';
import 'package:infinite_products/data/models/product/raw/raw_review.dart';

part 'raw_product.g.dart';

@JsonSerializable()
class RawProduct {
  RawProduct(
      {this.id,
      this.title,
      this.description,
      this.category,
      this.price,
      this.discountPercentage,
      this.rating,
      this.stock,
      this.tags,
      this.brand,
      this.sku,
      this.weight,
      this.dimensions,
      this.warrantyInformation,
      this.shippingInformation,
      this.availabilityStatus,
      this.reviews,
      this.returnPolicy,
      this.minimumOrderQuantity,
      this.meta,
      this.images,
      this.thumbnail});

  final int? id;
  final String? title;
  final String? description;
  final String? category;
  final double? price;
  final double? discountPercentage;
  final double? rating;
  final int? stock;
  final List<String>? tags;
  final String? brand;
  final String? sku;
  final int? weight;
  final RawDimension? dimensions;
  final String? warrantyInformation;
  final String? shippingInformation;
  final String? availabilityStatus;
  final List<RawReview>? reviews;
  final String? returnPolicy;
  final int? minimumOrderQuantity;
  final RawMeta? meta;
  final List<String>? images;
  final String? thumbnail;
  Map<String, dynamic> toJson() => _$RawProductToJson(this);

  factory RawProduct.fromJson(Map<String, dynamic> json) =>
      _$RawProductFromJson(json);
}
