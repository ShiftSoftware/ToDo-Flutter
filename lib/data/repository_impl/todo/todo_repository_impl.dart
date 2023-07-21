import 'dart:convert';

import 'package:clean_todo/domain/entity/todo_entity.dart';
import 'package:clean_todo/domain/repository/todo/todo_local_data_source.dart';
import 'package:clean_todo/domain/repository/todo/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoLocalDataSource todoLocalDataSource;

  const TodoRepositoryImpl({required this.todoLocalDataSource});

  @override
  void saveTodo(Todo todo) {
    final save = jsonEncode(todo.toLocalDto());
    todoLocalDataSource.saveTodo(save);
  }

  @override
  List<Todo> getTodos() {
    final todos = todoLocalDataSource.getTodos();
    print("Todos size: ${todos}");
    if (todos == null || todos.isEmpty) return [];
    final map = todos.map((e) => jsonDecode(e));
    return todoFromMap(map);
  }
}
