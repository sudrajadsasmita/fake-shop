import 'package:dartz/dartz.dart';
import 'package:fake_shop/core/error/failures.dart';
import 'package:fake_shop/core/usecase/usecase.dart';
import 'package:fake_shop/features/product/domain/repositories/product_repository.dart';

class InsertProduct implements UseCase<void, Params> {
  final ProductRepository repository;
  InsertProduct({required this.repository});
  @override
  Future<Either<Failure, void>> call(Params params) async {
    return await repository.insertProduct(
      params.title,
      params.price,
      params.description,
      params.image,
      params.category,
    );
  }
}

class Params {
  final String title;
  final double price;
  final String description;
  final String image;
  final String category;

  Params({
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.category,
  });
}
