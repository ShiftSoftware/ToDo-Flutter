import 'package:clean_todo/domain/entity/todo_entity.dart';
import 'package:clean_todo/domain/repository/todo/todo_repository.dart';
import 'package:flutter/material.dart';

class TodoProvider extends ChangeNotifier {
  final TodoRepository todoRepository;

  List<Todo> todos = [];

  TodoProvider(this.todoRepository);

  void saveTodo(Todo todo, {bool updateTodo = false}) {
    todoRepository.saveTodo(todo);

    if(updateTodo){
      _getTodos();
    }
  }

  void _getTodos() {
    todos = todoRepository.getTodos();
    notifyListeners();
  }
}
