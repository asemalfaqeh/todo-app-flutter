part of '../todo_list_page.dart';


class TodoCard extends StatefulWidget {
  final TodoModel todo;
  final Function() onRemove;
  final Function(bool) onToggleComplete;

  const TodoCard({super.key,
    required this.todo,
    required this.onRemove,
    required this.onToggleComplete,
  });

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(
              widget.todo.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red,),
              onPressed: ()=> widget.onRemove(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(widget.todo.description),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(
                  "${widget.todo.date.year.toString()}/${widget.todo.date.month.toString()}/${widget.todo.date.day.toString()}",
                  style: const TextStyle(
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              const Spacer(),
              Switch(
                value: widget.todo.isComplete,
                onChanged: (value) {
                  widget.todo.isComplete = value;
                  widget.onToggleComplete(widget.todo.isComplete);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
