import 'package:flutter/material.dart';

import '../models/Product.dart';

class ShoppingCartViewModel extends ChangeNotifier {
  final Map<Product, int> _cartItems = {};

  Map<Product, int> get cartItems => _cartItems;

  int getQuantity(Product product) {
    return _cartItems.containsKey(product) ? _cartItems[product]! : 0;
  }

  void addItemToCart(Product product) {
    if (_cartItems.containsKey(product)) {
      _cartItems[product] = (_cartItems[product] ?? 0) + 1;
    } else {
      _cartItems[product] = 1;
    }
    notifyListeners();
  }

  void removeItemFromCart(Product product) {
    if (_cartItems.containsKey(product)) {
      _cartItems[product] = (_cartItems[product] ?? 0) - 1;
      if (_cartItems[product]! <= 0) {
        _cartItems.remove(product);
      }
    }
    notifyListeners();
  }

  void deleteItemFromCart(Product product) {
    if (_cartItems.containsKey(product)) {
      _cartItems.remove(product);
    }
    notifyListeners();
  }

  int getTotalItemsInCart() {
    return _cartItems.values.fold(0, (sum, itemCount) => sum + itemCount);
  }
}
