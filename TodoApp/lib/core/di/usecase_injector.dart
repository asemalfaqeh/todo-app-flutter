import 'package:get_it/get_it.dart';

import '../../domain/usecase/get_add_todo_usecase.dart';
import '../../domain/usecase/get_edit_todo_usecase.dart';
import '../../domain/usecase/get_list_todos_usecase.dart';
import '../../domain/usecase/get_remove_todo_usecase.dart';

Future<void> initUseCase(GetIt instance) async{
  instance.registerLazySingleton<GetAddTodoUseCase>(() => GetAddTodoUseCase(instance.call()));
  instance.registerLazySingleton<GetEditTodoUseCase>(() => GetEditTodoUseCase(instance.call()));
  instance.registerLazySingleton<GetListTodosUseCase>(() => GetListTodosUseCase(instance.call()));
  instance.registerLazySingleton<GetRemoveTodoUseCase>(() => GetRemoveTodoUseCase(instance.call()));
}