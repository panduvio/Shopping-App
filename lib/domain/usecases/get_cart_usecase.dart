import 'package:shopping_app/domain/entities/product_entity.dart';
import 'package:shopping_app/domain/repositories/local_product_repository.dart';

class GetCartUsecase {
  final LocalProductRepository repository;

  GetCartUsecase(this.repository);

  Future<List<ProductEntity>> getCart() {
    return repository.getCart();
  }
}
