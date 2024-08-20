import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fake_shop/core/error/failures.dart';
import 'package:fake_shop/core/usecase/usecase.dart';
import 'package:fake_shop/features/product/domain/entities/product.dart';
import 'package:fake_shop/features/product/domain/usecases/get_product_detail.dart';
import 'package:fake_shop/features/product/domain/usecases/get_products.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProducts getProductList;
  final GetProductDetail getProductDetail;

  ProductBloc({required this.getProductList, required this.getProductDetail})
      : super(ProductInitial()) {
    on<FetchProductList>(_onFetchProductList);
    on<FetchProductDetail>(_onFetchProductDetail);
  }

  void _onFetchProductList(
      FetchProductList event, Emitter<ProductState> emit) async {
    emit(ProductLoading());
    final Either<Failure, List<Product>> failureOnProduct =
        await getProductList(NoParams());
    emit(
      failureOnProduct.fold(
        (failure) => ProductError(message: _mapFailureToMessage(failure)),
        (products) => ProductListLoaded(products: products),
      ),
    );
  }

  void _onFetchProductDetail(
      FetchProductDetail event, Emitter<ProductState> emit) async {
    emit(ProductLoading());
    final Either<Failure, Product> failureOrProduct = await getProductDetail(
      Params(
        id: event.productId,
      ),
    );
    emit(
      failureOrProduct.fold(
        (failure) => ProductError(message: _mapFailureToMessage(failure)),
        (product) => ProductDetailLoaded(product: product),
      ),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure():
        return "Server Failure";
      case CacheFailure():
        return "Cache failure";
      default:
        return "Unexpected Error";
    }
  }
}
