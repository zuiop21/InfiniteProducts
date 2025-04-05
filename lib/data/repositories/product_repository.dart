import 'package:infinite_products/data/models/product/processed/product.dart';
import 'package:infinite_products/data/services/product_service.dart';

class ProductRepository {
  ProductRepository({ProductService? pokemonService})
      : _productService = pokemonService ?? ProductService();

  final ProductService _productService;

  Future<List<Product>> getProducts(int limit, int skip) async {
    try {
      final rawList = await _productService.fetchRawProducts(limit, skip);

      final processedList =
          rawList.map((rawProduct) => Product.fromRaw(rawProduct)).toList();
      return processedList;
    } catch (e) {
      rethrow;
    }
  }
}
