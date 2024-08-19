import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigasi ke halaman ProductListScreen
            context.go('/products');
          },
          child: Text('Go to Products'),
        ),
      ),
    );
  }
}
