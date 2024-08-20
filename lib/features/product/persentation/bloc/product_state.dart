part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductListLoaded extends ProductState {
  final List<Product> products;

  const ProductListLoaded({required this.products});

  @override
  List<Object> get props => [products];
}

class ProductDetailLoaded extends ProductState {
  final Product product;

  const ProductDetailLoaded({required this.product});

  @override
  List<Object> get props => [product];
}

class ProductInserted extends ProductState {}

class ProductUpdated extends ProductState {}

class ProductDeleted extends ProductState {}

class ProductError extends ProductState {
  final String message;

  const ProductError({required this.message});

  @override
  List<Object> get props => [message];
}
