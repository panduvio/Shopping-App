import 'package:shopping_app/domain/entities/product_entity.dart';

abstract class LocalProductRepository {
  Future<void> addToCart(ProductEntity product);
  Future<List<ProductEntity>> getCart();
}
