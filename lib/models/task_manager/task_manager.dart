import 'package:equatable/equatable.dart';
import 'package:kaizen/models/task/task.dart';
part 'task_manager.g.dart';

class TaskManager extends Equatable {
  final List<Task> tasks;

  const TaskManager({required this.tasks});

  factory TaskManager.fromJson(Map<String, dynamic> json) =>
      _$TaskManagerFromJson(json);
  Map<String, dynamic> toJson() => _$TaskManagerToJson(this);

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
