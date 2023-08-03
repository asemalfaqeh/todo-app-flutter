import 'package:todo_app_flutter/data/repo_impl/todo_repo_impl.dart';
import 'package:todo_app_flutter/domain/repo/todo_repo.dart';
import 'package:get_it/get_it.dart';

Future<void> initRepo(GetIt instance) async{
  instance.registerLazySingleton<TodoRepo>(() => TodoRepoImpl(instance.call()));
}