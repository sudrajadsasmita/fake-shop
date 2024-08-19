part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class FetchProductList extends ProductEvent {}

class FetchProductDetail extends ProductEvent {
  final String productId;

  const FetchProductDetail({required this.productId});

  @override
  List<Object> get props => [productId];
}
