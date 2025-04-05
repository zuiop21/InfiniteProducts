import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_products/business_logic/bloc/product_bloc.dart';
import 'package:infinite_products/presentation/widgets/product_description.dart';
import 'package:infinite_products/presentation/widgets/product_images.dart';
import 'package:infinite_products/presentation/widgets/product_banner.dart';

class ProductDetailedPage extends StatelessWidget {
  const ProductDetailedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final product = context.read<ProductBloc>().state.selectedProduct;
    //GestureDetector to close the detailed page, by tapping on the screen anywhere
    return GestureDetector(
      onTap: () {
        context.read<ProductBloc>().add(const ShowProductDetailsEvent(null));
      },
      behavior: HitTestBehavior.opaque,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          //In case the data to load is too long
          child: SingleChildScrollView(
            child: Column(
              children: [
                if (product != null) ...[
                  ProductBanner(product: product),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: ProductDescription(product: product),
                  ),
                  ProductImages(product: product),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
