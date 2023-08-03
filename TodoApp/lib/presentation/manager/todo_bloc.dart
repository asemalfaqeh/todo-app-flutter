import 'bloc.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {

  final GetAddTodoUseCase addTodoUseCase = instance<GetAddTodoUseCase>();
  final GetRemoveTodoUseCase removeTodoUseCase = instance<GetRemoveTodoUseCase>();
  final GetEditTodoUseCase editTodoUseCase = instance<GetEditTodoUseCase>();
  final GetListTodosUseCase todosUseCase = instance<GetListTodosUseCase>();

  TodoBloc() : super(TodoInitial()) {
    on<TodoEvent>((event, emit) async {
      if(event is AddTodoEvent){
        var status = await addTodoUseCase.call(event.todoModel);
        emit(TodoAddedState(status));
      }else if(event is AllTodosEvent){
        List<TodoModel> todos = await todosUseCase.call();
        emit(AllTodosState(todos));
      }else if(event is RemoveTodoEvent){
        var status = await removeTodoUseCase.call(event.todoModel);
        emit(TodoRemovedState(status));
      }else if(event is EditTodoEvent){
        var status = await editTodoUseCase.call(event.todoModel);
        emit(TodoEditedState(status));
      }else if(event is InitialEvent){
        emit(TodoInitial());
      }
    });
  }
}
