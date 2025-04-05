import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:infinite_products/constants/app_colors.dart';
import 'package:infinite_products/data/models/product/processed/product.dart';

/// This widget displays the product images
class ProductImages extends StatelessWidget {
  final Product product;
  const ProductImages({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            "Images",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: SizedBox(
              height: 200,
              //Check if the product has images
              child: product.images.isNotEmpty
                  ? ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: product.images.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Container(
                            width: 200,
                            height: 200,
                            color: AppColors.cardColor,
                            child: CachedNetworkImage(
                              imageUrl: product.images[index],
                              placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                              errorWidget: (context, url, error) => const Icon(
                                Icons.error,
                              ),
                              fit: BoxFit.contain,
                            ),
                          ),
                        );
                      },
                    )
                  : const Center(
                      child: Text(
                      "No images available",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    )),
            ),
          )
        ]),
      ),
    );
  }
}
