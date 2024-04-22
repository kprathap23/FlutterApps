import 'package:flutter/material.dart';
import 'package:themoviedb/view_models/MoviesListViewModel.dart';
import 'package:themoviedb/views/MoviesListScreen.dart';

import 'SettingsScreen.dart';

class MovieAppHome extends StatefulWidget {
  @override
  _MovieAppHomeState createState() => _MovieAppHomeState();
}

class _MovieAppHomeState extends State<MovieAppHome> {
  int _currentIndex = 0;
  late MoviesListViewModel _homeViewModel;

  @override
  void initState() {
    super.initState();
    _homeViewModel = MoviesListViewModel();
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_currentIndex == 0 ? 'Home' : 'Settings'),
      ),
      body: _currentIndex == 0
          ? MoviesListScreen(viewModel: _homeViewModel)
          : SettingsScreen(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
