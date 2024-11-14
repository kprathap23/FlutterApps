import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/Todo.dart';

class TodoService {
  final String apiUrl = 'https://dummyjson.com/todos';

  Future<List<Todo>> fetchTodos() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final List<dynamic> todosJson = jsonDecode(response.body)['todos'];
      return todosJson.map((json) => Todo.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load todos');
    }
  }
}
