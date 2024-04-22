import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'view_models/ProductListViewModel.dart';
import 'view_models/ShoppingCartViewModel.dart';
import 'views/ProductListPage.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ProductListViewModel()),
      ChangeNotifierProvider(create: (_) => ShoppingCartViewModel()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FakeStore ',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: ProductListPage(),
    );
  }
}
