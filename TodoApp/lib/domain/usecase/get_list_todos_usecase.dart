
import 'package:todo_app_flutter/core/usecase/single_usecase.dart';
import 'package:todo_app_flutter/domain/repo/todo_repo.dart';

import '../../data/model/todo_model.dart';

class GetListTodosUseCase extends SingleUseCase<List<TodoModel>>{

  final TodoRepo todoRepo;

  GetListTodosUseCase(this.todoRepo);

  @override
  Future<List<TodoModel>> call() {
    return todoRepo.listTodosRepo();
  }

}