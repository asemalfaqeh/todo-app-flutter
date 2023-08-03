part of 'add_todo_page.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key});

  @override
  _AddTodoScreenState createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {

  final _formKey = GlobalKey<FormState>();

  late String _name;
  late String _description;
  DateTime? _selectedDate;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final newTodo = TodoModel(
        id: Random().nextInt(1000).toString(),
        title: _name,
        description: _description,
        date: _selectedDate ?? DateTime.now(),
        isComplete: false
      );

      context.read<TodoBloc>().add(AddTodoEvent(newTodo));
      // Clear the form
      _formKey.currentState!.reset();

      context.read<BottomNavigationCubit>().updateCurrentIndex(0);

    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<TodoBloc, TodoState>(
        listener: (context, state) {
          if(state is TodoAddedState){
            if(state.status){
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Success Added"),
              ));
            }
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Title'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a title';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _name = value!;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Description'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a description';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _description = value!;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () async {
                      //
                      final selectedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2023),
                        lastDate: DateTime(2024),
                      );

                      if (selectedDate != null) {
                        setState(() {
                          _selectedDate = selectedDate;
                        });
                      }

                    },
                    child: Text(
                      _selectedDate == null
                          ? 'Select Date'
                          : 'Selected Date: ${_selectedDate!.toString().split(
                          ' ')[0]}',
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: _submitForm,
                    child: const Text('Add'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Todo {
  final String name;
  final String description;
  final DateTime date;

  Todo({
    required this.name,
    required this.description,
    required this.date,
  });
}
