import 'dart:convert';

import 'package:clean_todo/domain/repository/todo/todo_local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoLocalService implements TodoLocalDataSource {
  final SharedPreferences localStorage;

  const TodoLocalService(this.localStorage);

  @override
  void saveTodo(Map<String, dynamic> todo) {
    localStorage.setString("todos", jsonEncode(todo));
  }
}
