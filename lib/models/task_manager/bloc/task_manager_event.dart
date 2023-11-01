part of 'task_manager_bloc.dart';

abstract class TaskManagerEvent {
  const TaskManagerEvent();
}

class NewTaskEvent extends TaskManagerEvent {
  final Task task;

  const NewTaskEvent(this.task);
}

class DeleteTaskEvent extends TaskManagerEvent {
  final int toDelete;

  const DeleteTaskEvent(this.toDelete);
}

class InteractEvent extends TaskManagerEvent {
  final int index;

  const InteractEvent(this.index);
}
