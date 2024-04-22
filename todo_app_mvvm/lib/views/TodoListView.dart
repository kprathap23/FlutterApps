import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/Todo.dart';
import '../view_models/TodoViewModel.dart';
import 'TodoDetailsView.dart';

class TodoListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
        elevation: 0.5,
      ),
      body: Consumer<TodoViewModel>(
        builder: (context, model, child) {
          if (model.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (!model.hasInternet) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('No internet connection'),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Provider.of<TodoViewModel>(context, listen: false)
                          .checkInternetConnection();
                    },
                    child: Text('Retry'),
                  ),
                ],
              ),
            );
          } else {
            return _buildTodoList(context, model);
          }
        },
      ),
    );

  }

  Widget _buildTodoList(BuildContext context, TodoViewModel model) {
    return ListView.builder(
      itemCount: model.todos.length,
      itemBuilder: (context, index) {
        final todo = model.todos[index];
        return Dismissible(
          key: Key(todo.id.toString()),
          confirmDismiss: (_) =>
              _showDeleteConfirmationDialog(context, todo),
          background: Container(
            color: Colors.red,
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Icon(Icons.delete, color: Colors.white),
          ),
          onDismissed: (_) {
            // Call deleteTodo method to delete the todo item
            Provider.of<TodoViewModel>(context, listen: false)
                .deleteTodo(todo.id);
          },
          child: ListTile(
            title: Text(todo.title),
            leading: Checkbox(
              value: todo.completed,
              onChanged: (bool? value) {
                // Handle checkbox change
                // Update todo completion status
                final updatedTodo =
                todo.copyWith(completed: value ?? false);
                // Call a method to update the todo in the view model
                Provider.of<TodoViewModel>(context, listen: false)
                    .updateTodo(updatedTodo);
              },
            ),
            onTap: () {
              Provider.of<TodoViewModel>(context, listen: false)
                  .navigateToTodoDetails(context, todo);
            },
          ),
        );
      },
    );
  }

  Future<bool?> _showDeleteConfirmationDialog(BuildContext context, Todo todo) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete Todo'),
          content: Text('Are you sure you want to delete this todo?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('CANCEL'),
            ),
            TextButton(
              onPressed: () {
                // Call deleteTodo method to delete the todo item
                Provider.of<TodoViewModel>(context, listen: false)
                    .deleteTodo(todo.id);
                Navigator.of(context).pop(true);
              },
              child: Text('DELETE'),
            ),
          ],
        );
      },
    );
  }
}
