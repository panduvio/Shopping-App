import 'package:shopping_app/domain/entities/product_entity.dart';
import 'package:shopping_app/domain/repositories/local_product_repository.dart';

class AddToCartUsecase {
  final LocalProductRepository repository;

  AddToCartUsecase(this.repository);

  Future<void> addToCart(ProductEntity product) {
    return repository.addToCart(product);
  }
}
