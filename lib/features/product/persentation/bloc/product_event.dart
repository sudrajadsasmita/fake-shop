part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class FetchProductList extends ProductEvent {
  final int page;
  final int pageSize;

  const FetchProductList({required this.page, required this.pageSize});
}

class FetchProductDetail extends ProductEvent {
  final String productId;

  const FetchProductDetail({required this.productId});

  @override
  List<Object> get props => [productId];
}

class InsertProduct extends ProductEvent {
  final String title;
  final double price;
  final String description;
  final String image;
  final String category;

  const InsertProduct({
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.category,
  });
}

class UpdatedProduct extends ProductEvent {
  final String title;
  final double price;
  final String description;
  final String image;
  final String category;

  const UpdatedProduct({
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.category,
  });
}

class DeletedProduct extends ProductEvent {
  final String id;

  const DeletedProduct({required this.id});
}
