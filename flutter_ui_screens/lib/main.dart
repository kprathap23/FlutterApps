import 'package:flutter/material.dart';
import 'package:flutter_ui_screens/screens/dashboard/PhonepeHomeScreen.dart';
import 'package:flutter_ui_screens/screens/profile/ProfileScreen1.dart';
import 'package:flutter_ui_screens/screens/drawer/DrawerNavigationScreen.dart';
import 'package:flutter_ui_screens/screens/slider/BannerScreen1.dart';

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
        useMaterial3: false,
      ),
      // home: const BottomNavigationScreen(),
      //home: DrawerNavgiationScreen(),
      // home: ProfileScreen1(),
     // home: BannerScreen1(),
     home: PhonePeHomeScreen(),
    );
  }
}
