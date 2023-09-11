import 'package:clean_todo/data/local/local_storage.dart';
import 'package:clean_todo/data/local/todo/todo_local_service.dart';
import 'package:clean_todo/data/repository_impl/todo/todo_repository_impl.dart';
import 'package:clean_todo/domain/entity/todo_entity.dart';
import 'package:clean_todo/domain/repository/todo/todo_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group("TodoRepositoryImpl", () {
    test("Adding Todo to storage, length should be 1", () async {
      SharedPreferences.setMockInitialValues({});
      SharedPreferences localService = await SharedPreferences.getInstance();
      TodoRepository todoRepository = TodoRepositoryImpl(
          todoLocalDataSource: TodoLocalService(localService));

      todoRepository.saveTodo(const Todo(title: "Test", description: "Test"));
      expect(todoRepository.getTodos().length, 1);
    });

    test("Deleting Todo from storage, length should be 0", () async {
      SharedPreferences.setMockInitialValues({});
      SharedPreferences localService = await SharedPreferences.getInstance();
      TodoRepository todoRepository = TodoRepositoryImpl(
          todoLocalDataSource: TodoLocalService(localService));

      Todo todo = Todo(title: "Test", description: "Test");

      todoRepository.saveTodo(todo);

      todoRepository.deleteTodo(todo);

      expect(todoRepository.getTodos().length, 0);
    });

    test("Updating Todo from storage, Title should be changed to \"Task 1\".", () async {
      SharedPreferences.setMockInitialValues({});
      SharedPreferences localService = await SharedPreferences.getInstance();
      TodoRepository todoRepository = TodoRepositoryImpl(
          todoLocalDataSource: TodoLocalService(localService));

      Todo todo = Todo(title: "Test", description: "Test");

      todoRepository.saveTodo(todo);

      Todo newTodo = Todo(title: "Task 1", description: "Test");

      todoRepository.updateTodo(todo, newTodo);

      expect(todoRepository.getTodos()[0].title, "Task 1");
    });

    test("Deleting all Todos from storage, length of the list should 0.", () async {
      SharedPreferences.setMockInitialValues({});
      SharedPreferences localService = await SharedPreferences.getInstance();
      TodoRepository todoRepository = TodoRepositoryImpl(
          todoLocalDataSource: TodoLocalService(localService));

      Todo todo1 = Todo(title: "Test", description: "Test");
      Todo todo2 = Todo(title: "Test", description: "Test");
      Todo todo3 = Todo(title: "Test", description: "Test");

      todoRepository.saveTodo(todo1);
      todoRepository.saveTodo(todo2);
      todoRepository.saveTodo(todo3);

      todoRepository.deleteAllTodos();

      expect(todoRepository.getTodos().length, 0);
    });
  });
}
