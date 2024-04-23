import 'dart:convert';

import 'package:fakestore_app/models/Rating.dart';

List<Product> productsListFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productListToJson(List<Product> data) =>
    json.encode(List<Product>.from(data.map((x) => x.toJson())));

class Product {
  final int id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  final Rating rating;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'].toDouble(),
      imageUrl: json['image'],
      rating: Rating.fromJson(json["rating"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "image": imageUrl,
        "rating": rating.toJson(),
      };
}
