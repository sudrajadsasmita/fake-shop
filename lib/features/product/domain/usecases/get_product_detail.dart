import 'package:dartz/dartz.dart';
import 'package:fake_shop/core/error/failures.dart';
import 'package:fake_shop/core/usecase/usecase.dart';
import 'package:fake_shop/features/product/domain/entities/product.dart';
import 'package:fake_shop/features/product/domain/repositories/product_repository.dart';

class GetProductDetail implements UseCase<Product, Params> {
  final ProductRepository repository;

  GetProductDetail(this.repository);
  @override
  Future<Either<Failure, Product>> call(Params params) async {
    return await repository.getProductDetail(params.id);
  }
}

class Params {
  final String id;
  Params({required this.id});
}
