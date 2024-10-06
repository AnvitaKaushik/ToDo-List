import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/Task/task_bloc.dart';
import 'package:to_do_app/Task/task_event.dart';
import 'package:to_do_app/Task/task_state.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
        backgroundColor: Colors.lightGreen[200],
      ),
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          return state.tasks.isEmpty
              ? Center(
            child: Text(
              'No tasks added yet!',
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            ),
          )
              : ListView.builder(
            itemCount: state.tasks.length,
            itemBuilder: (context, index) {
              final task = state.tasks[index];
              return Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: ListTile(
                  contentPadding: EdgeInsets.all(16),
                  title: Text(
                    task.name,
                    style: TextStyle(
                      fontSize: 18,
                      color: task.isDone ? Colors.grey : Colors.black,
                      decoration:
                      task.isDone ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  leading: Checkbox(
                    value: task.isDone,
                    onChanged: (value) {
                      context.read<TaskBloc>().add(ToggleTask(index));
                    },
                    activeColor: Colors.lightGreen,
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightGreen[600],
        onPressed: () => _showAddTaskDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddTaskDialog(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text(
            'Add Task',

          ),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: 'Task name',
              hintStyle: TextStyle(color: Colors.grey[400]),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.lightGreen[600]!),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.lightGreen[300]!),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  context.read<TaskBloc>().add(AddTask(controller.text));
                  Navigator.of(dialogContext).pop();
                }
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.lightGreen[600],
              ),
              child: const Text('Add'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        );
      },
    );
  }

}
