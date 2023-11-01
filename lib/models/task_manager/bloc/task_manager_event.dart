part of 'task_manager_bloc.dart';

abstract class TaskManagerEvent {
  const TaskManagerEvent();
}

class AddTask extends TaskManagerEvent {
  final Task task;

  const AddTask(this.task);
}

class DeleteTaskEvent extends TaskManagerEvent {
  final int toDelete;

  const DeleteTaskEvent(this.toDelete);
}
