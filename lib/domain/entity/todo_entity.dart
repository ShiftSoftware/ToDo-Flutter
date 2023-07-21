
List<Todo> todoFromMap(todos)=>List.from(todos.map((x)=>Todo.fromLocalToEntity(x)));
class Todo {
  final String title, description;

  const Todo({required this.title, required this.description});

  factory Todo.fromLocalToEntity(Map<String, dynamic> todo) {
    return Todo(title: todo["title"], description: todo["description"]);
  }

  Map<String, dynamic> toLocalDto() {
    return {
      "title": title,
      "description": description,
    };
  }
}
