import 'package:todo_app_flutter/core/usecase/base_usecase.dart';
import 'package:todo_app_flutter/data/model/todo_model.dart';
import 'package:todo_app_flutter/domain/repo/todo_repo.dart';

class GetAddTodoUseCase extends BaseUseCase<bool,TodoModel>{

  final TodoRepo repo;
  GetAddTodoUseCase(this.repo);
  @override
  Future<bool> call(TodoModel input) {
    return repo.addTodoModel(input);
  }

}