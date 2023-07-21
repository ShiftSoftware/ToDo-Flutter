import 'package:clean_todo/domain/entity/todo_entity.dart';
import 'package:clean_todo/ui/providers/todo_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final Map<String, String> formData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Todo"),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                onChanged: (value) {
                  formData[TITLE] = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) return "Can't be empty";

                  return null;
                },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: "Title"),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                onChanged: (value) {
                  formData[DESCRIPTION] = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) return "Can't be empty";

                  return null;
                },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: "description"),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
                onPressed: () {
                  final validate = formKey.currentState?.validate() ?? false;
                  if (!validate) return;

                  final Todo todo = Todo(
                      title: formData[TITLE]!,
                      description: formData[DESCRIPTION]!);

                  context.read<TodoProvider>().saveTodo(todo, updateTodo: true);
                  Navigator.of(context).pop();
                },
                child: const Text("Add"))
          ],
        ),
      ),
    );
  }

  static const String TITLE = "title";
  static const String DESCRIPTION = "description";
}
