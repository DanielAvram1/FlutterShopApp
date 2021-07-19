import 'package:flutter/material.dart';
import 'package:fluttershopapp/providers/cart.dart';
import 'package:fluttershopapp/providers/product.dart';
import 'package:fluttershopapp/providers/products.dart';
import 'package:fluttershopapp/widgets/badge.dart';
import 'package:fluttershopapp/widgets/products_grid.dart';
import 'package:provider/provider.dart';

enum FilterOptions {
  Favorites,
  All
}

class ProductsOverviewScreen extends StatefulWidget {
  static const routeName = '/';

  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('MyFlutterShop'),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if(selectedValue == FilterOptions.Favorites){
                  _showOnlyFavorites = true;
                }
                else {
                  _showOnlyFavorites = false;
                }
              });
              
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Favorites'),
                value: FilterOptions.Favorites,
              ),
              PopupMenuItem(
                child: Text('Show all'),
                value: FilterOptions.All,
              ),
            ]
          ),
          Consumer<Cart>(
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {},
            ),
            builder: (_, cart, child) => Badge(
              child: child == null ? Container() : child,
              value: cart.itemCount.toString()
            ),
          ),
        ],
      ),
      body: ProductsGrid(_showOnlyFavorites),
    );
  }
}