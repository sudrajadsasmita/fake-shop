import 'package:dartz/dartz.dart';
import 'package:fake_shop/core/error/failures.dart';
import 'package:fake_shop/core/usecase/usecase.dart';
import 'package:fake_shop/features/product/domain/repositories/product_repository.dart';

class DeleteProduct implements UseCase<void, Params> {
  final ProductRepository productRepository;

  DeleteProduct({required this.productRepository});
  @override
  Future<Either<Failure, void>> call(Params params) async {
    return await productRepository.deleteProduct(params.id);
  }
}

class Params {
  final String id;
  Params({required this.id});
}
