import 'package:dartz/dartz.dart';
import 'package:fake_shop/core/error/failures.dart';
import 'package:fake_shop/core/usecase/usecase.dart';
import 'package:fake_shop/features/product/domain/entities/product.dart';
import 'package:fake_shop/features/product/domain/repositories/product_repository.dart';

class InsertProduct implements UseCase<void, Product> {
  final ProductRepository repository;
  InsertProduct({required this.repository});

  @override
  Future<Either<Failure, void>> call(Product product) async {
    return await repository.insertProduct(product);
  }
}
