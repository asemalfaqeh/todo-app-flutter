import 'package:todo_app_flutter/data/local_storage/todo_datasource.dart';
import 'package:todo_app_flutter/data/model/todo_model.dart';

import '../../domain/repo/todo_repo.dart';

class TodoRepoImpl extends TodoRepo{

  final TodoDataSource dataSource;

  TodoRepoImpl(this.dataSource);

  @override
  Future<bool> addTodoModel(TodoModel todoModel) async {
    return await dataSource.addTodoModel(todoModel);
  }

  @override
  Future<bool> editTotoRepo(TodoModel todoModel) async {
    return await dataSource.editTotoDataSource(todoModel);
  }

  @override
  Future<List<TodoModel>> listTodosRepo() async{
    return await dataSource.getTodosDataSource();
  }

  @override
  Future<bool> removeTodoRepo(TodoModel todoModel) async{
    return await dataSource.removeTodoDataSource(todoModel);
  }

}