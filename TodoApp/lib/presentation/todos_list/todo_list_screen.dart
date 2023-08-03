part of 'todo_list_page.dart';

class TodoListScreen extends StatefulWidget {

  const TodoListScreen({Key? key}) : super(key: key);

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  @override
  Widget build(BuildContext context) {

    context.read<TodoBloc>().add(AllTodosEvent());

    return SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: BlocConsumer<TodoBloc, TodoState>(
            listener: (context, state) {
              if(state is TodoRemovedState) {
                context.read<TodoBloc>().add(AllTodosEvent());
              }else if(state is TodoEditedState){
                context.read<TodoBloc>().add(AllTodosEvent());
              }else if(state is TodoAddedState){
                context.read<TodoBloc>().add(AllTodosEvent());
              }
            },
            builder: (context, state) {
              return BlocBuilder<TodoBloc, TodoState>(
                  builder: (context, state) {
                    if (state is AllTodosState) {

                      print("[TodoListLength] :: ${state.todos.length}");
                      if(state.todos.isEmpty){
                        return _buildEmptyData();
                      }

                      return ListView.builder(
                        itemCount: state.todos.length,
                        itemBuilder: (context, index) {
                          return TodoCard(
                            todo: state.todos[index],
                            onRemove: () {
                              context.read<TodoBloc>().add(RemoveTodoEvent(state.todos[index]));
                            },
                            onToggleComplete: (isCompleted) {
                              context.read<TodoBloc>().add(EditTodoEvent(
                                  TodoModel(
                                      id: state.todos[index].id,
                                      date: state.todos[index].date,
                                      description: state.todos[index].description,
                                      title: state.todos[index].title,
                                      isComplete: isCompleted
                                  )
                              ));
                            },
                          );
                        },
                      );
                    } else {
                      return _buildEmptyData();
                    }
                  }
              );
            },
          ),
        ));
  }

  Widget _buildEmptyData(){
   return const Center(
      child: Text("No Data"),
    );
  }
}
