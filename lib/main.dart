import 'package:flutter/material.dart';
import 'package:fluttershopapp/providers/products.dart';
import 'package:provider/provider.dart';

import 'package:fluttershopapp/screens/product_detail_screen.dart';
import 'package:fluttershopapp/screens/products_overview_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Products(),
      child: MaterialApp(
        title: 'My Flutter Shop',
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          ProductsOverviewScreen.routeName: (ctx) => ProductsOverviewScreen()
        },
        initialRoute: ProductsOverviewScreen.routeName,
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato'
        ),
      ),
    );
  }
  
}
