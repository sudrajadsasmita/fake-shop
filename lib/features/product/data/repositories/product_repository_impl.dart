import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fake_shop/core/error/failures.dart';
import 'package:fake_shop/features/product/data/models/product_model.dart';
import 'package:fake_shop/features/product/domain/entities/product.dart';
import 'package:fake_shop/features/product/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final Dio dio;
  ProductRepositoryImpl({required this.dio});
  @override
  Future<Either<Failure, Product>> getProductDetail(String id) async {
    try {
      final response = await dio.get("https://yourapi.com/api/products/$id");
      if (response.statusCode == 200) {
        final product = ProductModel.fromJson(response.data);
        return Right(product);
      } else {
        return Left(ServerFailure());
      }
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getProducts() async {
    try {
      final response = await dio.get("https://yourapi.com/api/products");
      if (response.statusCode == 200) {
        final products = (response.data as List)
            .map((json) => ProductModel.fromJson(json))
            .toList();
        return Right(products);
      } else {
        return Left(ServerFailure());
      }
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
