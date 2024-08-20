import 'package:dartz/dartz.dart';
import 'package:fake_shop/core/error/failures.dart';
import 'package:fake_shop/features/product/domain/entities/product.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getProducts();
  Future<Either<Failure, Product>> getProductDetail(String id);
  Future<Either<Failure, Product>> getProductDetail(String id);
}
