import 'package:flutter/material.dart';
import 'package:fluttershopapp/providers/cart.dart';
import 'package:fluttershopapp/providers/orders.dart';
import 'package:fluttershopapp/providers/products.dart';
import 'package:fluttershopapp/screens/cart_screen.dart';
import 'package:fluttershopapp/screens/edit_product_screen.dart';
import 'package:fluttershopapp/screens/orders_screen.dart';
import 'package:fluttershopapp/screens/user_products_screen.dart';
import 'package:provider/provider.dart';

import 'package:fluttershopapp/screens/product_detail_screen.dart';
import 'package:fluttershopapp/screens/products_overview_screen.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Products(),
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
        ChangeNotifierProvider.value(
          value: Orders(),
        )
      ], 
      child: MaterialApp(
        title: 'My Flutter Shop',
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          ProductsOverviewScreen.routeName: (ctx) => ProductsOverviewScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          OrdersScreen.routeName: (ctx) => OrdersScreen(),
          UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
          EditProductScreen.routeName: (ctx) => EditProductScreen(),
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
