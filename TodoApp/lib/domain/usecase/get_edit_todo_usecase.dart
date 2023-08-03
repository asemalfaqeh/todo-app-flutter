import 'package:todo_app_flutter/core/usecase/base_usecase.dart';
import 'package:todo_app_flutter/data/model/todo_model.dart';
import 'package:todo_app_flutter/domain/repo/todo_repo.dart';

class GetEditTodoUseCase extends BaseUseCase<bool,TodoModel>{
  final TodoRepo todoRepo;
  GetEditTodoUseCase(this.todoRepo);
  @override
  Future<bool> call(TodoModel input) {
    return todoRepo.editTotoRepo(input);
  }
}