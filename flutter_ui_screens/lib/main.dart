import 'package:flutter/material.dart';
import 'package:flutter_ui_screens/screens/dashboard/PhonepeHomeScreen.dart';
import 'package:flutter_ui_screens/screens/profile/ProfileScreen1.dart';
import 'package:flutter_ui_screens/screens/drawer/DrawerNavigationScreen.dart';
import 'package:flutter_ui_screens/screens/slider/BannerScreen1.dart';

import 'screens/bottombar/BottomNavigationScreen.dart';
import 'screens/bottombar/CurvedBottomBarM3.dart';
import 'screens/dashboard/HomeScreen.dart';
import 'screens/profile/ProfileScreen2.dart';

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

        // home: BannerScreen1(),
        //home: PhonePeHomeScreen(),
        //home: HomeScreen());

        // home: CurvedBottomBarM3());

        home: ProfileScreen2());
  }
}
