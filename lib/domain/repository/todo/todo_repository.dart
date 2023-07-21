import 'package:clean_todo/domain/entity/todo_entity.dart';
import 'package:clean_todo/domain/repository/repository.dart';

abstract class TodoRepository extends Repository {
  void saveTodo(Todo todo);
  List<Todo> getTodos();
}
