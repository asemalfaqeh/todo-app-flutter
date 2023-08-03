import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/todo_model.dart';

/*
(..)
 /|\ #AF#
 */
abstract class TodoDataSource{
  Future<bool> addTodoModel(TodoModel todoModel);
  Future<List<TodoModel>> getTodosDataSource();
  Future<bool> removeTodoDataSource(TodoModel todoModel);
  Future<bool> editTotoDataSource(TodoModel todoModel);
}

class TodoDataSourceImpl extends TodoDataSource{
  static const _todosKey = 'todos';

  final SharedPreferences prefs;

  TodoDataSourceImpl(this.prefs);

  @override
  Future<bool> addTodoModel(TodoModel todoModel) async{
    final todoList = await getTodosDataSource();
    todoList.add(todoModel);
    await _saveTodos(todoList);
    return true;
  }

  @override
  Future<bool> editTotoDataSource(TodoModel todoModel) async{
    final todoList = await getTodosDataSource();
    final index = todoList.indexWhere((todo) => todo.id == todoModel.id);
    if (index != -1) {
      todoList[index] = todoModel;
      await _saveTodos(todoList);
      return true;
    }else{
      return false;
    }
  }


  @override
  Future<bool> removeTodoDataSource(TodoModel todoModel) async{
    final todoList = await getTodosDataSource();
    todoList.removeWhere((todo) => todo.id == todoModel.id);
    await _saveTodos(todoList);
    return true;
  }

  // get all todos
  @override
  Future<List<TodoModel>> getTodosDataSource() async {
    final todoListJson = prefs.getStringList(_todosKey);
    if (todoListJson != null) {
      return todoListJson.map((json) => TodoModel.fromJson(jsonDecode(json))).toList();
    }
    return [];
  }

  // save the list of todos
  Future<void> _saveTodos(List<TodoModel> todos) async {
    final todoListJson = todos.map((todo) => jsonEncode(todo.toJson())).toList();
    await prefs.setStringList(_todosKey, todoListJson);
  }
}