import 'package:dio/dio.dart';
import 'package:fake_shop/features/product/data/repositories/product_repository_impl.dart';
import 'package:fake_shop/features/product/domain/usecases/get_product_detail.dart';
import 'package:fake_shop/features/product/domain/usecases/get_products.dart';
import 'package:fake_shop/features/product/persentation/bloc/product_bloc.dart';
import 'package:fake_shop/features/product/persentation/pages/product_detail_screen.dart';
import 'package:fake_shop/features/product/persentation/pages/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GoRouter router = GoRouter(
      initialLocation: "/",
      routes: [
        GoRoute(
          path: "/",
          builder: (context, state) => ProductListScreen(),
        ),
        GoRoute(
          path: "/product/:id",
          builder: (context, state) {
            final productId = state.pathParameters["id"]!;
            return ProductDetailScreen(productId: productId);
          },
        ),
      ],
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductBloc(
            getProductList: GetProducts(
              ProductRepositoryImpl(
                dio: Dio(),
              ),
            ),
            getProductDetail: GetProductDetail(
              ProductRepositoryImpl(
                dio: Dio(),
              ),
            ),
          ),
        )
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flutter clean architecture',
        theme: ThemeData(
          primaryColor: Colors.blue,
          useMaterial3: false,
        ),
        routerConfig: router,
      ),
    );
  }
}
