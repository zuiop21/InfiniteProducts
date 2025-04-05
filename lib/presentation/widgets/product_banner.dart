import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:infinite_products/constants/app_colors.dart';
import 'package:infinite_products/data/models/product/processed/product.dart';

/// This widget displays the product banner with the product title and thumbnail
class ProductBanner extends StatelessWidget {
  final Product product;
  const ProductBanner({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      color: AppColors.cardColor,
      child: Row(
        children: [
          Expanded(
            flex: 40,
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                  product.title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 60,
            child: Align(
                alignment: Alignment.centerRight,
                child: CachedNetworkImage(
                  fit: BoxFit.contain,
                  imageUrl: product.thumbnail,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(
                      color: Colors.red,
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
