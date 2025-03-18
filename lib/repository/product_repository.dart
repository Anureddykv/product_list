import 'package:dio/dio.dart';
import 'package:product_list/models/product.dart';

class ProductRepository {
  final Dio _dio;
  final String apiUrl = 'http://demo9844902.mockable.io/sstpath';

  ProductRepository(this._dio);


  Future<List<Product>> fetchProducts() async {
    try {
      final response = await _dio.get(apiUrl);
        if (response.data is List) {
        return (response.data as List)
            .map((json) => Product.fromJson(json))
            .toList();
      } else {
        throw Exception("Unexpected response format");
      }
    } catch (error) {
      throw Exception('Error fetching products: $error');
    }
  }
}
