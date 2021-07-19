import 'package:flutter/foundation.dart';

class CartItem {
  final String title;
  final String id;
  final double price;
  int quantity;
  final String imageUrl;

  CartItem({
    required this.id,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.quantity,
  });
}

class Cart with ChangeNotifier {
  late Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, value) {total += value.price * value.quantity;});
    return total;
  }

  void addItem(String productId, double price, String title, String imageUrl) {
    if(_items.containsKey(productId))
      _items.update(productId, (pred) => CartItem(
        id: pred.id,
        title: pred.title,
        price: pred.price,
        imageUrl: imageUrl,
        quantity: pred.quantity + 1
      ));
    else
      _items.putIfAbsent(productId, () => CartItem(
      id: DateTime.now().toString(), 
      title: title,
      price: price,
      imageUrl: imageUrl,
      quantity: 1
    ));
    notifyListeners();
  }
  void addQuantityTo({required String key, int toAdd = 1}){
    if(items[key]!.quantity + toAdd >= 0){
      items[key]!.quantity += toAdd;
      notifyListeners();
    }
  }

  void deleteByKey(String key) {
    _items.remove(key);
    notifyListeners();
  }

}