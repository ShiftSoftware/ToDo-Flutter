abstract class TodoLocalDataSource {

  void saveTodo(String todo);
  void deleteTodo(String todo);
  void updateTodo(String oldTodo,String todo);

  void deleteAllTodos();

  List<String>? getTodos();

}
