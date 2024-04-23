// Define ViewModel to manage product list
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/Product.dart';

class ProductListViewModel extends ChangeNotifier {
  List<Product> products = [];

  ProductListViewModel() {
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      products.clear();
      products = productsListFromJson(response.body);

      notifyListeners();
    } else {
      throw Exception('Failed to fetch products');
    }
  }
}
