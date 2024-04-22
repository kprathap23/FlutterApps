import 'package:flutter/material.dart';

import '../models/Todo.dart';

class TodoDetailsView extends StatelessWidget {
  final Todo todo;

  const TodoDetailsView({required this.todo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              todo.title,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              'Status: ${todo.completed ? "Completed" : "Pending"}',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
