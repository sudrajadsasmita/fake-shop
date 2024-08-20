import 'package:dartz/dartz.dart';
import 'package:fake_shop/core/error/failures.dart';
import 'package:fake_shop/features/product/data/datasource/product_remote_data_source.dart';
import 'package:fake_shop/features/product/data/models/product_model.dart';
import 'package:fake_shop/features/product/domain/entities/product.dart';
import 'package:fake_shop/features/product/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSourceImpl productRemoteDataSourceImpl;
  ProductRepositoryImpl({required this.productRemoteDataSourceImpl});
  @override
  Future<Either<Failure, Product>> getProductDetail(String id) async {
    try {
      final product = await productRemoteDataSourceImpl.getProductDetail(id);
      return Right(product);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getProducts(
      int page, int pageSize) async {
    try {
      final products =
          await productRemoteDataSourceImpl.getProduct(page, pageSize);
      return Right(products);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteProduct(String id) async {
    try {
      await productRemoteDataSourceImpl.deleteProduct(id);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> insertProduct(Product product) async {
    try {
      final productModel = ProductModel.fromEntity(product);
      await productRemoteDataSourceImpl.insertProduct(productModel);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateProduct(Product product) async {
    try {
      final productModel = ProductModel.fromEntity(product);
      await productRemoteDataSourceImpl.updateProduct(productModel);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
