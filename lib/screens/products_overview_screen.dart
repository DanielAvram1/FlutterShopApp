import 'package:flutter/material.dart';
import 'package:fluttershopapp/providers/product.dart';
import 'package:fluttershopapp/widgets/products_grid.dart';

class ProductsOverviewScreen extends StatelessWidget {
  static const routeName = '/';
  final List<Product> loadedProducts = [];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('MyFlutterShop'),
      ),
      body: ProductsGrid(),
    );
  }
}