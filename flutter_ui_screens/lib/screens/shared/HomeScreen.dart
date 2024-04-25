import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final String? name;

  HomeScreen({this.name});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.blue[100], child: Center(child: Text(widget.name!))),
    );
  }
}
