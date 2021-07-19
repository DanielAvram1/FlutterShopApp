import 'package:flutter/material.dart';
import 'package:fluttershopapp/providers/cart.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {

  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final remainingHeight = MediaQuery.of(context).size.height - AppBar().preferredSize.height;
    final Cart cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: [
          Card(
            
            margin: EdgeInsets.all(15),
            child: Container(
              height: remainingHeight * 0.1,
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      '\$${cart.totalAmount}',
                      style: TextStyle(
                        color: Theme.of(context).primaryTextTheme.title!.color
                         
                      ),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  TextButton(
                    child: Text(
                      'ORDER NOW',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor
                      ),
                    ),
                    onPressed: () {},
                    
                  )
                ],
              )
            )
          ),
          Container(
            height: remainingHeight * 0.75,
            child: ListView.builder(
              itemCount: cart.itemCount,
              itemBuilder: (ctx, i) {
                String key = cart.items.keys.elementAt(i);
                CartItem value = cart.items[key] as CartItem;
                return Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        value.title
                      ),
                      Text(
                        '${value.price}\$'
                      ),
                      
                      Row(
                        children: [
                          TextButton(
                            child: Text('-'),
                            onPressed: () {
                              cart.addQuantityTo(key: key, toAdd: -1);
                            },
                            
                          ),
                          Text(
                            '${value.quantity}'
                          ),
                          TextButton(
                            child: Text('+'),
                            onPressed: () {
                              cart.addQuantityTo(key: key);
                            },
                          ),
                        ],
                      ),
                      Text(
                        '${value.price * value.quantity}\$'
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          cart.deleteByKey(key);
                        },
                        color: Colors.red,
                      )
                    ],
                  )
                );
              } 
            ),
          )
        ],
      ),

    );
  }
}