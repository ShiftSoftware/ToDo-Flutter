import 'package:clean_todo/TestInterface.dart';
import 'package:clean_todo/domain/entity/todo_entity.dart';
import 'package:clean_todo/domain/repository/todo/todo_repository.dart';
import 'package:flutter/material.dart';

class TodoProvider extends ChangeNotifier {
  final TodoRepository todoRepository;

  List<Todo> todos = [];

  TodoProvider(this.todoRepository) {
    _getTodos();
    testImpl();
  }

  void saveTodo(Todo todo, {bool updateTodo = false}) {
    todoRepository.saveTodo(todo);

    if (updateTodo) {
      _getTodos();
    }
  }

  void _getTodos() {
    todos = todoRepository.getTodos();
    notifyListeners();
  }

  void deleteTodo(Todo todo, {bool updateTodo = false}) {
    todoRepository.deleteTodo(todo);

    if (updateTodo) {
      _getTodos();
    }
  }

  void updateTodo(Todo oldTodo, Todo todo, {bool updateTodo = false}) {
    todoRepository.updateTodo(oldTodo, todo);

    if (updateTodo) {
      _getTodos();
    }
  }

  void deleteAll({bool updateTodo = false}) {
    todoRepository.deleteAllTodos();

    if (updateTodo) {
      _getTodos();
    }
  }

  bool get showDeleteAll => todosSize != 0;

  int get todosSize => todos.length;

  void testImpl() async {
    try {
      TodoRepoImpl todoRepoImpl = TodoRepoImpl();


      final res = await todoRepoImpl.getData();
      print("Todo result:");
      print(res.toMap());

    } catch (e) {
      print(e);
    }
  }
}

class TodoRepoImpl implements TodoRepo<TodoRemote> {
  TodoRemoteDataSource<TodoRemote> testInterface = TodoRemoteDataSource();

  @override
  Future<TodoRemote> getData() {
    return testInterface.getData(TodoRemote.fromMap);
  }


}

abstract class TodoRepo<T> {
  Future<T> getData();
}
