import 'package:clean_todo/domain/entity/todo_entity.dart';
import 'package:clean_todo/domain/repository/todo/todo_local_data_source.dart';
import 'package:clean_todo/domain/repository/todo/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoLocalDataSource todoLocalDataSource;

  const TodoRepositoryImpl({required this.todoLocalDataSource});

  @override
  void saveTodo(Todo todo) {
    todoLocalDataSource.saveTodo(todo.toLocalDto());
  }
}
