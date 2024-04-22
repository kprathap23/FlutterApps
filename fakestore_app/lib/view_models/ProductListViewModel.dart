// Define ViewModel to manage product list
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/Product.dart';

class ProductListViewModel extends ChangeNotifier {
  final List<Product> _products = [];
  List<Product> get products => _products;

  ProductListViewModel() {
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      _products.clear();
      _products.addAll(data.map((json) => Product.fromJson(json)).toList());
      notifyListeners();
    } else {
      throw Exception('Failed to fetch products');
    }
  }
}
