import 'package:fake_shop/features/product/domain/entities/product.dart';

class ProductModel extends Product {
  ProductModel({
    required int id,
    required double price,
    required String title,
    required String description,
  }) : super(id: id, price: price, title: title, description: description);

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"],
      price: json["price"].toDouble(),
      title: json["title"],
      description: json["description"],
    );
  }
}
