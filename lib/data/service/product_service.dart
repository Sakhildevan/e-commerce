import 'package:dio/dio.dart';

import '../model/product_model.dart';

class ProductService {
  final Dio _dio = Dio();
  final String baseUrl =
      'https://fake-store-api.mock.beeceptor.com/api/products';

  Future<List<Product>> fetchProducts() async {
    try {
      final response = await _dio.get(baseUrl);
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data.map((item) => Product.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }
}
