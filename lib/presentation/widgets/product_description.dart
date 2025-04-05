import 'package:flutter/material.dart';
import 'package:infinite_products/data/models/product/processed/product.dart';

/// This widget displays the product description
class ProductDescription extends StatelessWidget {
  final Product product;
  const ProductDescription({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Description",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              //Check if the product has description
              child: product.description.isNotEmpty
                  ? Text(
                      product.description,
                      style: const TextStyle(fontSize: 16),
                    )
                  : const Text(
                      "No description available",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
