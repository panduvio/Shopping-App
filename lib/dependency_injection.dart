import 'package:get_it/get_it.dart';
import 'package:shopping_app/data/repositories/api_product_repository_impl.dart';
import 'package:shopping_app/data/sources/product_api.dart';
import 'package:shopping_app/domain/repositories/api_product_repository.dart';
import 'package:shopping_app/domain/usecases/add_to_cart_usecase.dart';
import 'package:shopping_app/domain/usecases/get_all_products_usecase.dart';
import 'package:shopping_app/domain/usecases/search_product_usecase.dart';

final sl = GetIt.instance;

void setup() {
  // Database Singleton
  sl.registerLazySingleton<ProductApi>(() => ProductApi());

  // Repository Singleton
  sl.registerLazySingleton<ApiProductRepository>(
    () => ApiProductRepositoryImpl(),
  );

  // Usecase Singleton
  sl.registerLazySingleton<GetAllProductsUsecase>(
    () => GetAllProductsUsecase(sl()),
  );
  sl.registerLazySingleton<AddToCartUsecase>(() => AddToCartUsecase(sl()));
  sl.registerLazySingleton<SearchProductUsecase>(() => SearchProductUsecase());
}
