import 'package:shopping_app/domain/entities/product_entity.dart';

class SearchProductUsecase {
  List<ProductEntity> searchProducts(
    String query,
    List<ProductEntity> products,
  ) {
    if (query.isEmpty) return products;

    return products
        .where(
          (product) =>
              product.title.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
  }
}
