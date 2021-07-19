import 'package:flutter/material.dart';
import 'package:fluttershopapp/providers/cart.dart';
import 'package:fluttershopapp/providers/product.dart';
import 'package:fluttershopapp/screens/product_detail_screen.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;
  
  // ProductItem(this.id, this.title, this.imageUrl);
  
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName, 
              arguments: product.id
            );
          },
          child: Image.network(
            product.imageUrl, 
            fit: BoxFit.cover
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(
            builder: (ctx, product, _) => IconButton(
              icon:  Icon(product.isFavorite ? Icons.favorite : Icons.favorite_border),
              onPressed: product.toggleFavoriteStatus, 
              color: Theme.of(context).accentColor
            ), 
          ),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              cart.addItem(product.id, product.price, product.title, product.imageUrl);
            },
            color: Theme.of(context).accentColor
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    
    );
  }
}