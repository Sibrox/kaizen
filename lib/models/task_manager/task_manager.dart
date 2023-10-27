import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:kaizen/models/task/task.dart';
part 'task_manager.g.dart';

@JsonSerializable()
class TaskManager extends Equatable {
  final List<Task> tasks;

  const TaskManager({required this.tasks});

  factory TaskManager.withNewTask(TaskManager taskManager, Task newTask) =>
      TaskManager(tasks: [...taskManager.tasks, newTask]);

  factory TaskManager.deleteTask(TaskManager taskManager, Task toDelete) {
    return TaskManager(
        tasks:
            taskManager.tasks.where((element) => element != toDelete).toList());
  }

  @override
  List<Object?> get props => [tasks];
}
