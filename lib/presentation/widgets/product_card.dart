import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_products/business_logic/bloc/product_bloc.dart';
import 'package:infinite_products/constants/app_colors.dart';
import 'package:infinite_products/data/models/product/processed/product.dart';
import 'package:infinite_products/presentation/widgets/product_card_data.dart';

/// This widget displays the product card with the product image, title, price, and stock
class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  /// This method is used to show the detailed product page when the user taps on the product card
  void _showDetailedProduct(BuildContext context) {
    context.read<ProductBloc>().add(ShowProductDetailsEvent(product));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showDetailedProduct(context),
      //SingleChildScrollView in case the device is small
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.0,
              child: Container(
                color: AppColors.cardColor,
                child: CachedNetworkImage(
                  imageUrl: product.thumbnail,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ProductCardData(
                product: product,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
