import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_mvvm/view_models/TodoViewModel.dart';
import 'package:todo_app_mvvm/views/TodoListView.dart';

void main() {


  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TodoViewModel()),
        //ChangeNotifierProvider(create: (context) => OtherViewModel()),
        // Add more ChangeNotifierProviders for other view models if needed
      ],
      child:const MyApp(),
    ),
  );
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

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  TodoListView(),
    );
  }
}
