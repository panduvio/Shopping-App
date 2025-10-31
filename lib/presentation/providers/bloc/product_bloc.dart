import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/dependency_injection.dart';
import 'package:shopping_app/domain/entities/product_entity.dart';
import 'package:shopping_app/domain/usecases/get_all_products_usecase.dart';
import 'package:shopping_app/domain/usecases/search_product_usecase.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(TryToGetState()) {
    on<GetAllProducts>(_getAllProducts);
  }

  void _getAllProducts(GetAllProducts event, Emitter<ProductState> emit) async {
    emit(TryToGetState());
    try {
      print('trying on bloc');
      final products = await sl<GetAllProductsUsecase>().getAllProducts();
      emit(GetAllSuccessState(products));
    } catch (e) {
      throw Exception('Failed to get all products: $e');
    }
  }
}
