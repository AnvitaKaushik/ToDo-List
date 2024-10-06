abstract class TaskEvent {}

class AddTask extends TaskEvent {
  final String taskName;

  AddTask(this.taskName);
}

class ToggleTask extends TaskEvent {
  final int index;

  ToggleTask(this.index);
}
