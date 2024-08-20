import 'package:dio/dio.dart';
import 'package:fake_shop/features/product/data/models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getProduct(int page, int pageSize);
  Future<ProductModel> getProductDetail(String id);
  Future<void> insertProduct(ProductModel product);
  Future<void> updateProduct(ProductModel product);
  Future<void> deleteProduct(String id);
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final Dio dio;
  ProductRemoteDataSourceImpl({required this.dio});

  @override
  Future<void> deleteProduct(String id) async {
    await dio.delete("https://fakestoreapi.com/products/$id");
  }

  @override
  Future<List<ProductModel>> getProduct(int page, int pageSize) async {
    final response =
        await dio.get("https://fakestoreapi.com/products", queryParameters: {
      'page': page,
      'pageSize': pageSize,
    });
    if (response.statusCode == 200) {
      final List products = response.data as List;
      return products
          .map((products) => ProductModel.fromJson(products))
          .toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  @override
  Future<ProductModel> getProductDetail(String id) async {
    final response = await dio.get("https://fakestoreapi.com/products/${id}");
    if (response.statusCode == 200) {
      final product = response.data;
      return ProductModel.fromJson(product);
    } else {
      throw Exception('Failed to load products');
    }
  }

  @override
  Future<void> insertProduct(ProductModel product) async {
    await dio.post("https://fakestoreapi.com/products", data: product.toJson());
  }

  @override
  Future<void> updateProduct(ProductModel product) async {
    await dio.put("https://fakestoreapi.com/products/${product.id}",
        data: product.toJson());
  }
}
