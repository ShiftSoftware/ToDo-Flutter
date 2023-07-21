import 'package:clean_todo/domain/repository/todo/todo_repository.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier{
  final TodoRepository todoRepository;

  HomeProvider(this.todoRepository);


}