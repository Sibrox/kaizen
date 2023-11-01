import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:kaizen/models/task/simple_task.dart';
import 'package:kaizen/models/task/task.dart';
part 'task_manager.g.dart';

@JsonSerializable()
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

  factory TaskManager.interactTask(TaskManager taskManager, int index) {
    return TaskManager(
        tasks: taskManager.tasks.asMap().entries.map((currentEntry) {
      if (currentEntry.key == index) {
        return currentEntry.value.interact();
      }
      return currentEntry.value;
    }).toList());
  }

  @override
  List<Object?> get props => [tasks];
}
