import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/Model/task.dart';
import 'task_event.dart';
import 'task_state.dart';


class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskState(tasks: [])) {
    on<AddTask>(_onAddTask);
    on<ToggleTask>(_onToggleTask);
  }

  void _onAddTask(AddTask event, Emitter<TaskState> emit) {
    final updatedTasks = List<Task>.from(state.tasks)
      ..add(Task(name: event.taskName));
    emit(TaskState(tasks: updatedTasks));
  }

  void _onToggleTask(ToggleTask event, Emitter<TaskState> emit) {
    final updatedTasks = List<Task>.from(state.tasks);
    updatedTasks[event.index].isDone = !updatedTasks[event.index].isDone;
    emit(TaskState(tasks: updatedTasks));
  }
}
