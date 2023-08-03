

import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app_flutter/data/local_storage/todo_datasource.dart';

Future<void> initDatasource(GetIt instance) async{
  final prefs = await SharedPreferences.getInstance();
  instance.registerLazySingleton<TodoDataSource>(() => TodoDataSourceImpl(prefs));
}