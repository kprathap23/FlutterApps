import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_screens/screens/bottombar/SampleTestScreen.dart';

class CurvedBottomBarM3 extends StatefulWidget {
  @override
  _CurvedBottomBarM3State createState() => _CurvedBottomBarM3State();
}

class _CurvedBottomBarM3State extends State<CurvedBottomBarM3> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  _getBody() {
    switch (_selectedIndex) {
      case 0:
        return SampleTestPage("Home");
      case 1:
        return SampleTestPage("Search");
      case 2:
        return SampleTestPage("Cart");
      case 3:
        return SampleTestPage("Wishlist");
      case 4:
        return SampleTestPage("Profile");
      default:
        return Container(color: Colors.red);
    }
  }

  Widget buildTabItem(
      {required IconData icon, required String label, required int index}) {
    final isSelected = _selectedIndex == index;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 30,
          width: 30,
          child: IconButton(
            padding: const EdgeInsets.all(0),
            icon: Icon(icon),
            onPressed: () => _onItemTapped(index),
            color: isSelected ? Colors.red : Colors.grey,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            color: isSelected ? Colors.red : Colors.grey,
          ),
        ),
        // Container(height: 3),
        // Container(
        //   decoration: BoxDecoration(
        //     color: index == _selectedIndex ? Colors.red : Colors.transparent,
        //     shape: BoxShape.circle,
        //   ),
        //   height: 5,
        //   width: 5,
        // ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: const Text("Custom Bottom Navigation"),
      ),
      body: _getBody(),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: Colors.white,
        notchMargin: 8, // Increased notch margin
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              buildTabItem(icon: CupertinoIcons.home, label: "Home", index: 0),
              buildTabItem(
                  icon: CupertinoIcons.search, label: "Search", index: 1),
              SizedBox(width: 40), // Spacing for the floating button
              buildTabItem(
                  icon: CupertinoIcons.heart, label: "Wishlist", index: 2),
              buildTabItem(
                  icon: CupertinoIcons.settings, label: "Settings", index: 3),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation
          .centerDocked, // Changed from centerDocked to centerFloat
      floatingActionButton: Stack(
        alignment: Alignment.center,
        children: [
          // Custom shadow using a Container
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.red.withOpacity(0.3), // Shadow color
                  spreadRadius: 8,
                  blurRadius: 15,
                ),
              ],
            ),
          ),
          // FloatingActionButton on top
          FloatingActionButton(
            shape: CircleBorder(),
            onPressed: () {
              // Action for the FAB
            },
            child: Icon(
              Icons.shopping_basket,
              color: Colors.white,
            ),
            backgroundColor: Colors.red,
            elevation: 0, // Set to 0 to avoid default shadow
          ),
        ],
      ),
    );
  }
}
