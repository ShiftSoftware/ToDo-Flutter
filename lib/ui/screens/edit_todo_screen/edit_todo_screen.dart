import 'package:clean_todo/domain/entity/todo_entity.dart';
import 'package:clean_todo/ui/providers/todo_provider.dart';
import 'package:clean_todo/util/runcatching.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditTodoScreen extends StatefulWidget {
  final Todo todo;

  const EditTodoScreen(this.todo, {Key? key}) : super(key: key);

  @override
  State<EditTodoScreen> createState() => _EditTodoScreenState();
}

class _EditTodoScreenState extends State<EditTodoScreen> {
  late Todo todo;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final Map<String, String> formData = {};

  @override
  void initState() {
    super.initState();
    todo = widget.todo;
    formData[TITLE] = todo.title;
    formData[DESCRIPTION] = todo.description;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Todo"),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                initialValue: todo.title,
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
                initialValue: todo.description,
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

                  runCatching(
                    callback: () async {
                      return Future.value("abc");
                    },
                    success: (result) {
                      print("Call back result: $result");
                    },
                    error: (error) {

                    },
                  );

                  final Todo updatedTodo = Todo(
                      title: formData[TITLE]!,
                      description: formData[DESCRIPTION]!);

                  context
                      .read<TodoProvider>()
                      .updateTodo(todo, updatedTodo, updateTodo: true);
                  Navigator.of(context).pop();
                },
                child: const Text("Save"))
          ],
        ),
      ),
    );
  }

  static const String TITLE = "title";
  static const String DESCRIPTION = "description";
}
