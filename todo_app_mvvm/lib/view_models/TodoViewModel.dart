import 'package:flutter/material.dart';

import '../models/Todo.dart';
import '../services/TodoService.dart';
import '../utils/NetworkUtils.dart';
import '../views/TodoDetailsView.dart';

class TodoViewModel extends ChangeNotifier {
  final TodoService _todoService = TodoService();
  late List<Todo> todos = [];
  bool _isLoading = false;
  bool _hasInternet = true;

  bool get isLoading => _isLoading;
  bool get hasInternet => _hasInternet;

  TodoViewModel() {
    checkInternetConnection();
    fetchTodos();
  }

  Future<void> checkInternetConnection() async {
    _hasInternet = await NetworkUtils.checkInternetConnection();
    notifyListeners();
  }

  Future<void> fetchTodos() async {
    _isLoading = true;
    notifyListeners();
    try {
      todos = await _todoService.fetchTodos();
    } catch (e) {
      print('Error fetching todos: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void navigateToTodoDetails(BuildContext context, Todo todo) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TodoDetailsView(todo: todo),
      ),
    );
  }

  void updateTodo(Todo updatedTodo) {
    final index = todos.indexWhere((todo) => todo.id == updatedTodo.id);
    if (index != -1) {
      todos[index] = updatedTodo;
      notifyListeners();
    }
  }

  void deleteTodo(int todoId) {
    todos.removeWhere((todo) => todo.id == todoId);
    notifyListeners();
  }
}
