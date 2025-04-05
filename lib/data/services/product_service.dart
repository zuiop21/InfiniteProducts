import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:infinite_products/data/models/product/raw/raw_product.dart';

//Service class to fetch RAW data from the API
class ProductService {
  final http.Client httpClient;

  //Base url of the API
  static final _baseUrl = 'https://dummyjson.com/products';

  ProductService({http.Client? client}) : httpClient = client ?? http.Client();

  //Method to fetch raw products from the API
  Future<List<RawProduct>> fetchRawProducts(int limit, int skip) async {
    final response =
        await http.get(Uri.parse('$_baseUrl?limit=$limit&skip=$skip'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> productsJson = data['products'];
      final List<RawProduct> rawProducts =
          productsJson.map((json) => RawProduct.fromJson(json)).toList();

      return rawProducts;
    } else {
      throw Exception("Failed to load products");
    }
  }
}
