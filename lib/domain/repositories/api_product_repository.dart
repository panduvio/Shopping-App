import 'package:shopping_app/domain/entities/product_entity.dart';

abstract class ApiProductRepository {
  Future<List<ProductEntity>> getAllProducts();
}
