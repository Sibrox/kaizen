import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:kaizen/models/task/routine.enum.dart';
import 'package:kaizen/models/task/task.dart';

part 'counter_task.g.dart';

@JsonSerializable()
class CounterTask extends Task implements Equatable {
  final int maxValue;
  final int currentValue;

  const CounterTask(
      {required String title,
      required String description,
      required Routine routine,
      required int taskCredits,
      required this.maxValue,
      this.currentValue = 0,
      isDone = false})
      : super(
            description: description,
            routine: routine,
            title: title,
            taskCredits: taskCredits,
            isDone: isDone);

  factory CounterTask.interact(CounterTask task) {
    return CounterTask(
        title: task.description,
        description: task.description,
        routine: task.routine,
        taskCredits: task.taskCredits,
        maxValue: task.maxValue,
        currentValue: task.currentValue + 1,
        isDone: task.currentValue + 1 < task.maxValue ? false : true);
  }
  @override
  List<Object?> get props =>
      [title, description, routine, taskCredits, maxValue, currentValue];
}
