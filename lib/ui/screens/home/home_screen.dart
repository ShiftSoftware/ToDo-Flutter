import 'package:clean_todo/ui/providers/todo_provider.dart';
import 'package:clean_todo/ui/screens/add_todo/add_todo_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Consumer<TodoProvider>(
        builder: (context, TodoProvider todoProvider, child) {
          if (todoProvider.todos.isEmpty) {
            return Center(child: const Text("No todos found"));
          }
          final todos = todoProvider.todos;

          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];

              return ListTile(
                title: Text(todo.title),
                subtitle: Text(todo.description),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const AddTodoScreen(),
          ));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
