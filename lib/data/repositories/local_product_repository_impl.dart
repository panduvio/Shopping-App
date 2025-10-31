import 'package:shopping_app/data/sources/product_local_db.dart';
import 'package:shopping_app/domain/entities/product_entity.dart';
import 'package:shopping_app/domain/repositories/local_product_repository.dart';

class LocalProductRepositoryImpl implements LocalProductRepository {
  final ProductLocalDb _productLocalDb;
  LocalProductRepositoryImpl(this._productLocalDb);

  @override
  Future<void> addToCart(ProductEntity product) async {
    await _productLocalDb.addToCart(product);
  }

  @override
  Future<List<ProductEntity>> getCart() async {
    final cart = await _productLocalDb.getCart();
    return cart;
  }
}
