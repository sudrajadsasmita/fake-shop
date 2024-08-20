import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fake_shop/features/product/domain/entities/product.dart';
import 'package:fake_shop/features/product/domain/usecases/get_product_detail.dart';
import 'package:fake_shop/features/product/domain/usecases/get_products.dart';
part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProducts getProducts;
  final GetProductDetail getProductDetail;
  final InsertProduct insertProduct;
  final UpdatedProduct updatedProduct;
  final DeletedProduct deletedProduct;

  ProductBloc({
    required this.getProducts,
    required this.getProductDetail,
    required this.insertProduct,
    required this.updatedProduct,
    required this.deletedProduct,
  })
}
