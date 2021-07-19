import 'package:flutter/foundation.dart';

class CartItem {
  final String title;
  final String id;
  final double price;
  final int quantity;

  CartItem({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity
  });
}

class Cart with ChangeNotifier {
  late Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  void addItem(String productId, double price, String title) {
    if(_items.containsKey(productId))
      _items.update(productId, (pred) => CartItem(
        id: pred.id,
        title: pred.title,
        price: pred.price,
        quantity: pred.quantity + 1
      ));
    else
      _items.putIfAbsent(productId, () => CartItem(
      id: DateTime.now().toString(), 
      title: title,
      price: price,
      quantity: 1
    ));
  }

  int get itemCount {
    return _items == null ? 0 : _items.length;
  }

}