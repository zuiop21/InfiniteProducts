import 'package:flutter/material.dart';
import 'package:infinite_products/constants/app_colors.dart';
import 'package:infinite_products/data/models/product/processed/product.dart';

/// This widget displays the product card data with the product title, price, and stock
class ProductCardData extends StatelessWidget {
  final Product product;
  const ProductCardData({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 4),
          child: Text(
            product.title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 4.0),
          child: Text(
            "\$${product.price}",
            style: const TextStyle(
              fontSize: 16,
              color: AppColors.priceColor,
            ),
          ),
        ),
        Text(
          "${product.discountPercentage}% • ${product.stock} left",
          style: const TextStyle(
            fontSize: 14,
          ),
        )
      ],
    );
  }
}
