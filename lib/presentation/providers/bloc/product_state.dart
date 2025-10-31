part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TryToGetState extends ProductState {}

class FailedToGetState extends ProductState {}

class GetAllSuccessState extends ProductState {
  final List<ProductEntity> products;

  GetAllSuccessState(this.products);

  @override
  List<Object?> get props => [products];
}
