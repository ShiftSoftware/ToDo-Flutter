import 'package:clean_todo/data/local/local_storage.dart';
import 'package:clean_todo/data/local/todo/todo_local_service.dart';
import 'package:clean_todo/data/repository_impl/todo/todo_repository_impl.dart';
import 'package:clean_todo/domain/repository/todo/todo_repository.dart';
import 'package:clean_todo/ui/providers/todo_provider.dart';
import 'package:clean_todo/ui/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final localService = LocalStorage.instance;

    final TodoRepository todoRepository =
        TodoRepositoryImpl(todoLocalDataSource: TodoLocalService(localService));

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => TodoProvider(todoRepository)),
      ],
      child: MaterialApp(
        title: 'Todo Demo',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
