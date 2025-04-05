import 'package:equatable/equatable.dart';
import 'package:infinite_products/data/models/product/raw/raw_product.dart';

class Product extends Equatable {
  const Product(
      {required this.images,
      required this.description,
      required this.thumbnail,
      required this.title,
      required this.price,
      required this.stock,
      required this.discountPercentage});

  //The properties of the product that we will use in the app
  final List<String> images;
  final String description;
  final String thumbnail;
  final String title;
  final double price;
  final int stock;
  final double discountPercentage;

  //We could add more properties here from the raw product if needed...
  factory Product.fromRaw(RawProduct rawProduct) {
    return Product(
        title: rawProduct.title ?? 'No title',
        images: rawProduct.images ?? [],
        description: rawProduct.description ?? 'No description',
        thumbnail: rawProduct.thumbnail ?? '',
        price: rawProduct.price ?? 0.0,
        stock: rawProduct.stock ?? 0,
        discountPercentage: rawProduct.discountPercentage ?? 0.0);
  }

  @override
  List<Object?> get props =>
      [title, images, description, thumbnail, price, stock, discountPercentage];

  Product copyWith(
      {List<String>? images,
      String? description,
      String? thumbnail,
      String? title,
      double? price,
      int? stock,
      double? discountPercentage}) {
    return Product(
        images: images ?? this.images,
        description: description ?? this.description,
        thumbnail: thumbnail ?? this.thumbnail,
        title: title ?? this.title,
        price: price ?? this.price,
        stock: stock ?? this.stock,
        discountPercentage: discountPercentage ?? this.discountPercentage);
  }
}
