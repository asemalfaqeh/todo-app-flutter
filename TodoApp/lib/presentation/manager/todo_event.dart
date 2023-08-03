part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();
}

class AddTodoEvent extends TodoEvent{
  final TodoModel todoModel;
  const AddTodoEvent(this.todoModel);
  @override
  List<Object?> get props => [todoModel];
}

class RemoveTodoEvent extends TodoEvent{
  final TodoModel todoModel;
  const RemoveTodoEvent(this.todoModel);
  @override
  List<Object?> get props => [todoModel];
}

class EditTodoEvent extends TodoEvent{
  final TodoModel todoModel;
  const EditTodoEvent(this.todoModel);
  @override
  List<Object?> get props => [todoModel];
}

class AllTodosEvent extends TodoEvent{
  @override
  List<Object?> get props => [];
}

class InitialEvent extends TodoEvent{
  @override
  List<Object?> get props => [];
}