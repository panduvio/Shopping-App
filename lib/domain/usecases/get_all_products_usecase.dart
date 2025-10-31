import 'package:shopping_app/domain/entities/product_entity.dart';
import 'package:shopping_app/domain/repositories/api_product_repository.dart';

class GetAllProductsUsecase {
  final ApiProductRepository repository;

  GetAllProductsUsecase(this.repository);

  Future<List<ProductEntity>> getAllProducts() {
    return repository.getAllProducts();
  }
}
