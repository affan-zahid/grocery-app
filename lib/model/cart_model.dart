import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  // list of items on sale
  final List _shopItems = const [
    // [ itemName, itemPrice, imagePath, color, category ]
    ["Apple", "4.00", "lib/images/apple.png", Colors.red, "Fruits"],
    ["Banana", "2.50", "lib/images/banana.png", Colors.yellow, "Fruits"],
    ["Orange", "12.80", "lib/images/orange.png", Colors.orange, "Fruits"],
    ["Cherry", "1.00", "lib/images/cherry.png", Colors.red, "Fruits"],
    // Add more items with their categories
    ["turnip", "3.50", "lib/images/shaljam.png", Colors.red, "Vegetables"],
    ["Onion", "2.00", "lib/images/piyaj.png", Colors.pink, "Vegetables"],
    ["Peas", "5.00", "lib/images/matar.png", Colors.green, "Vegetables"],
    ["Potato", "7.50", "lib/images/aalu.png", Colors.brown, "Vegetables"],

    ["Yogurt", "1.99", "lib/images/yogurt.png", Colors.pink, "Dairy Products"],
    ["Cheese", "1.99", "lib/images/cheez.png", Colors.yellow, "Dairy Products"],
    ["Milk", "1.99", "lib/images/milk.png", Colors.purple, "Dairy Products"],
    ["Bread", "1.99", "lib/images/bread.png", Colors.brown, "Dairy Products"],

    ["Sprite", "1.99", "lib/images/sprite.png", Colors.green, "Soft Drinks"],
    ["Coke", "1.99", "lib/images/coke.png", Colors.red, "Soft Drinks"],
    ["Red-Bull", "1.99", "lib/images/red-bull.png", Colors.blue, "Soft Drinks"],
    ["Fanta", "1.99", "lib/images/fanta.png", Colors.orange, "Soft Drinks"],
  ];

  // list of cart items
  final List _cartItems = [];

  List get cartItems => _cartItems;

  List get shopItems => _shopItems;

  // add item to cart
  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  // calculate total price
  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < cartItems.length; i++) {
      totalPrice += double.parse(cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }

  // get items by category
  List getItemsByCategory(String category) {
    return _shopItems.where((item) => item[16] == category).toList();
    // return _shopItems.where((item) => item[4] == category).toList();
  }
}