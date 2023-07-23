import 'dart:convert';

import 'package:clean_todo/domain/repository/todo/todo_local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoLocalService implements TodoLocalDataSource {
  final SharedPreferences localStorage;

  const TodoLocalService(this.localStorage);

  @override
  void saveTodo(String todo) {
    final todos = getTodos();
    if (todos == null || todos.isEmpty) {
      localStorage.setStringList("todos", [todo]);
      return;
    }

    localStorage.setStringList("todos", [todo, ...todos]);
  }

  @override
  List<String>? getTodos() {
    return localStorage.getStringList("todos");
  }

  @override
  void deleteAllTodos() {
    localStorage.setStringList("todos", []);
  }

  @override
  void deleteTodo(String todo) {
    final todos = getTodos();
    if (todos == null || todos.isEmpty) return;
    todos.remove(todo);
    localStorage.setStringList("todos", todos);
  }

  @override
  void updateTodo(String oldTodo, String newTodo) {
    final todos = getTodos();
    if (todos == null || todos.isEmpty) return;
    todos.remove(oldTodo);
    localStorage.setStringList("todos", [newTodo, ...todos]);
  }
}
