import 'package:flutter/widgets.dart';
import 'package:shopping_app/dependency_injection.dart';
import 'package:shopping_app/domain/entities/product_entity.dart';
import 'package:shopping_app/domain/usecases/add_to_cart_usecase.dart';

class CartProvider with ChangeNotifier {
  List<ProductEntity> _cart = [];

  List<ProductEntity> get cart => _cart;

  void addToCart(ProductEntity product, int quantity) async {
    ProductEntity item = product;
    item.isAdded = true;
    item.quantity += quantity;
    await sl<AddToCartUsecase>().addToCart(product);
    notifyListeners();
  }
}
