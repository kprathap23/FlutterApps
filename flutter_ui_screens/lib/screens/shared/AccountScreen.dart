import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  final String? name;

  AccountScreen({this.name});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.deepOrange[200],
          child: Center(child: Text(widget.name!))),
    );
  }
}
