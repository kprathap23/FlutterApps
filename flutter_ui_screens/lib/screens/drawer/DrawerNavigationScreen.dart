import 'package:flutter/material.dart';
import 'package:flutter_ui_screens/screens/shared/HomeScreen.dart';

import '../shared/AccountScreen.dart';
import '../shared/CartScreen.dart';
import '../shared/CategoriesScreen.dart';
import '../shared/NotificationsScreen.dart';
import '../shared/SettingsScreen.dart';

class DrawerNavgiationScreen extends StatefulWidget {
  DrawerNavgiationScreen({
    super.key,
  });

  @override
  State<DrawerNavgiationScreen> createState() => _DrawerNavgiationScreenState();
}

class _DrawerNavgiationScreenState extends State<DrawerNavgiationScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Shopping App"),
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NotificationsScreens()),
                );
              },
            ),
          ],
        ),
        body: Center(
          child: [
            HomeScreen(name: "Home"),
            CategoriesScreen(name: "Categories"),
            AccountScreen(name: "Account"),
            CartScreen(name: "Cart"),
            SettingsScreen(),
          ][_selectedIndex],
        ),
        drawer: NavigationDrawer(
          selectedIndex: _selectedIndex,
          onDestinationSelected: _onItemTapped,
          children: const [
            UserAccountsDrawerHeader(
              accountName: Text("Pratap Kumar"),
              accountEmail: Text("kprathap23@gmail.com"),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 244, 141, 110),
              ),
              currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://randomuser.me/api/portraits/men/46.jpg")),
            ),
            // Padding(
            //   padding: EdgeInsets.fromLTRB(28, 16, 16, 10),
            //   child: Text(
            //     'Header',
            //     style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),
            //   ),
            // ),
            // Divider(),
            NavigationDrawerDestination(
              label: Text("Home"),
              icon: Icon(Icons.home),
              selectedIcon: Icon(Icons.home_rounded),
            ),
            NavigationDrawerDestination(
              label: Text("Categories"),
              icon: Icon(Icons.category),
              selectedIcon: Icon(Icons.category_rounded),
            ),

            NavigationDrawerDestination(
              label: Text("Account"),
              icon: Icon(Icons.person_4),
              selectedIcon: Icon(Icons.person_4_rounded),
            ),

            NavigationDrawerDestination(
              label: Text("Cart"),
              icon: Icon(Icons.shopping_bag),
              selectedIcon: Icon(Icons.shopping_bag_rounded),
            ),

            NavigationDrawerDestination(
              label: Text("Settings"),
              icon: Icon(Icons.settings),
              selectedIcon: Icon(Icons.settings_rounded),
            ),
          ],
        )
        // old drawer code
        // drawer: Drawer(
        //   child: ListView(
        //     // Important: Remove any padding from the ListView.
        //     padding: EdgeInsets.zero,
        //     children: [
        //       const UserAccountsDrawerHeader(
        //         accountName: Text("Pratap Kumar"),
        //         accountEmail: Text("kprathap23@gmail.com"),
        //         decoration: BoxDecoration(
        //           color: Color.fromARGB(255, 244, 141, 110),
        //         ),
        //         currentAccountPicture: CircleAvatar(
        //             backgroundImage: NetworkImage(
        //                 "https://randomuser.me/api/portraits/men/46.jpg")),
        //       ),
        //       // const DrawerHeader(
        //       //   decoration: BoxDecoration(
        //       //     color: Colors.blue,
        //       //   ),
        //       //   child: Text('Drawer Header'),
        //       // ),
        //       ListTile(
        //         leading: const Icon(Icons.home),
        //         title: const Text('Home'),
        //         selected: _selectedIndex == 0,
        //         onTap: () {
        //           // Update the state of the app
        //           _onItemTapped(0);
        //           // Then close the drawer
        //           Navigator.pop(context);
        //         },
        //       ),
        //       ListTile(
        //         leading: const Icon(Icons.category),
        //         title: const Text('Categories'),
        //         selected: _selectedIndex == 1,
        //         onTap: () {
        //           // Update the state of the app
        //           _onItemTapped(1);
        //           // Then close the drawer
        //           Navigator.pop(context);
        //         },
        //       ),
        //       ListTile(
        //         leading: const Icon(Icons.person_4),
        //         title: const Text('Account'),
        //         selected: _selectedIndex == 2,
        //         onTap: () {
        //           // Update the state of the app
        //           _onItemTapped(2);
        //           // Then close the drawer
        //           Navigator.pop(context);
        //         },
        //       ),
        //       ListTile(
        //         leading: const Icon(Icons.shopping_bag),
        //         title: const Text('Cart'),
        //         selected: _selectedIndex == 3,
        //         onTap: () {
        //           // Update the state of the app
        //           _onItemTapped(3);
        //           // Then close the drawer
        //           Navigator.pop(context);
        //         },
        //       ),
        //       ListTile(
        //         leading: const Icon(Icons.settings),
        //         title: const Text('Settings'),
        //         selected: _selectedIndex == 4,
        //         onTap: () {
        //           // Update the state of the app
        //           _onItemTapped(4);
        //           // Then close the drawer
        //           Navigator.pop(context);
        //         },
        //       ),
        //     ],
        //   ),
        // ),
        );
  }
}
