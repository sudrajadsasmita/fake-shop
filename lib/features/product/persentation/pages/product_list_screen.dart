import 'package:fake_shop/features/product/persentation/bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<ProductBloc>().add(FetchProductList());

    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ProductListLoaded) {
            return ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final product = state.products[index];
                return ListTile(
                  title: Text(product.title),
                  subtitle: Text('\$${product.price}'),
                  onTap: () {
                    context.push('/product/${product.id}');
                  },
                );
              },
            );
          } else if (state is ProductError) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
