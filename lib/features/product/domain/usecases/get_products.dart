import 'package:fake_shop/core/error/failures.dart';
import 'package:fake_shop/core/usecase/usecase.dart';
import 'package:fake_shop/features/product/domain/entities/product.dart';
import 'package:fake_shop/features/product/domain/repositories/product_repository.dart';
import 'package:dartz/dartz.dart';

class GetProducts implements UseCase<List<Product>, Params> {
  final ProductRepository repository;

  GetProducts(this.repository);

  @override
  Future<Either<Failure, List<Product>>> call(Params params) async {
    return await repository.getProducts(params.page, params.pageSize);
  }
}

class Params {
  final int page;
  final int pageSize;

  Params({required this.page, required this.pageSize});
}
