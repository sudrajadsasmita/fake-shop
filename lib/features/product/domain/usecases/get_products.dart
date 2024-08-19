import 'package:fake_shop/core/error/failures.dart';
import 'package:fake_shop/core/usecase/usecase.dart';
import 'package:fake_shop/features/product/domain/entities/product.dart';
import 'package:fake_shop/features/product/domain/repositories/product_repository.dart';
import 'package:dartz/dartz.dart';

class GetProducts implements UseCase<List<Product>, NoParams> {
  final ProductRepository repository;

  GetProducts(this.repository);

  @override
  Future<Either<Failure, List<Product>>> call(NoParams params) async {
    return await repository.getProducts();
  }
}
