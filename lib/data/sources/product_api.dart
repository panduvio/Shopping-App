import 'package:dio/dio.dart';
import 'package:shopping_app/domain/entities/product_entity.dart';

class ProductApi {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://fakestoreapi.com/',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    ),
  );

  Future<List<ProductEntity>> getAllProducts() async {
    try {
      print('trying on api service');
      final response = await _dio.get('products');
      print('response status: ${response.statusCode}');
      if (response.statusCode == 200) {
        final List<ProductEntity> products = (response.data as List)
            .map((e) => ProductEntity.fromMap(e))
            .toList();

        return products;
      } else {
        throw Exception('Failed to load products');
      }
    } on DioException catch (e) {
      throw Exception('API Error: ${e.message}');
    }
  }
}
