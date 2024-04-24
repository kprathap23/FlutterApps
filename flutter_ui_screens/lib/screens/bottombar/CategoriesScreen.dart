import 'package:flutter/material.dart';

class CategoriesScreen extends StatefulWidget {
  final String? name;

  CategoriesScreen({this.name});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.orange[100], child: Center(child: Text(widget.name!))),
    );
  }
}
