import 'package:shopping_app/data/sources/product_api.dart';
import 'package:shopping_app/domain/entities/product_entity.dart';
import 'package:shopping_app/domain/repositories/api_product_repository.dart';

class ApiProductRepositoryImpl implements ApiProductRepository {
  ProductApi _productApi = ProductApi();

  @override
  Future<List<ProductEntity>> getAllProducts() async {
    final products = await _productApi.getAllProducts();
    return products;
  }
}
