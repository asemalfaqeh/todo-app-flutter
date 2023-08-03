import 'package:todo_app_flutter/core/di/datasource_injector.dart';
import 'package:todo_app_flutter/core/di/repo_injector.dart';
import 'package:todo_app_flutter/core/di/usecase_injector.dart';
import 'package:get_it/get_it.dart';

final instance = GetIt.instance;

Future<void> initModules() async{
  await initDatasource(instance);
  await initRepo(instance);
  await initUseCase(instance);
}