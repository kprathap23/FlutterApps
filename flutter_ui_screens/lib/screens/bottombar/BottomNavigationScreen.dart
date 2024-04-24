import 'package:flutter/material.dart';

import 'AccountScreen.dart';
import 'CartScreen.dart';
import 'CategoriesScreen.dart';
import 'HomeScreen.dart';
import 'NotificationsScreen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        centerTitle: false,
        title: const Text("Shopping App"),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationsScreens()),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
          onDestinationSelected: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          //backgroundColor: Colors.orange,
          //surfaceTintColor: Colors.red,
          //indicatorColor: Colors.deepPurple,
          height: 80,
          animationDuration: const Duration(milliseconds: 250),
          selectedIndex: selectedIndex,
          elevation: .5,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: "Home"),
            NavigationDestination(
                icon: Icon(Icons.category), label: "categories"),
            NavigationDestination(icon: Icon(Icons.person_4), label: "Account"),
            NavigationDestination(icon: Icon(Icons.shopping_bag), label: "Cart")
          ]),
      body: [
        HomeScreen(name: "Home"),
        CategoriesScreen(name: "Categories"),
        AccountScreen(name: "Account"),
        CartScreen(name: "Cart")
      ][selectedIndex],
    );
  }
}
