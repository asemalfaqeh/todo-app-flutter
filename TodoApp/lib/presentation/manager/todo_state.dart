part of 'todo_bloc.dart';

abstract class TodoState extends Equatable {
  const TodoState();
}

class TodoInitial extends TodoState {
  @override
  List<Object> get props => [];
}

class AllTodosState extends TodoState{
  final List<TodoModel> todos;
  const AllTodosState(this.todos);
  @override
  List<Object?> get props => [todos];
}

class TodoAddedState extends TodoState{
  final bool status;
  const TodoAddedState(this.status);
  @override
  List<Object?> get props => [status];
}

class TodoRemovedState extends TodoState{
  final bool status;
  const TodoRemovedState(this.status);
  @override
  List<Object?> get props => [status];
}

class TodoEditedState extends TodoState{
  final bool status;
  const TodoEditedState(this.status);
  @override
  List<Object?> get props => [status];
}