import 'package:flutter/material.dart';
import 'package:flutter_ui_screens/screens/profile/ProfileScreen1.dart';
import 'package:flutter_ui_screens/screens/drawer/DrawerNavigationScreen.dart';

import 'screens/bottombar/BottomNavigationScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      // home: const BottomNavigationScreen(),
      //home: DrawerNavgiationScreen(),
      home: ProfileScreen1(),
    );
  }
}
