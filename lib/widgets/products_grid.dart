import 'package:flutter/material.dart';
import 'package:fluttershopapp/providers/products.dart';
import 'package:fluttershopapp/widgets/product_item.dart';
import 'package:provider/provider.dart';

class ProductsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final productsData =  Provider.of<Products>(context);
    final products = productsData.items;
    
    return GridView.builder(
      padding: EdgeInsets.all(10),
      itemCount: products.length,
      itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
        value: products[index],
        child: ProductItem(
          // products[index].id, 
          // products[index].title, 
          // products[index].imageUrl
        ),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, 
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10
      ),
    );
  }
}
