import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  final String? name;

  CartScreen({this.name});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.red[200], child: Center(child: Text(widget.name!))),
    );
  }
}
