import 'package:todo_app_flutter/data/model/todo_model.dart';

abstract class TodoRepo{
 Future<bool> addTodoModel(TodoModel todoModel);
 Future<List<TodoModel>> listTodosRepo();
 Future<bool> removeTodoRepo(TodoModel todoModel);
 Future<bool> editTotoRepo(TodoModel todoModel);
}