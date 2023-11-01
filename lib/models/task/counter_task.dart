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

  @override
  CounterTask interact() {
    return CounterTask(
        title: title,
        description: description,
        routine: routine,
        taskCredits: taskCredits,
        maxValue: maxValue,
        currentValue: currentValue + 1,
        isDone: currentValue + 1 < maxValue ? false : true);
  }

  factory CounterTask.fromJson(Map<String, dynamic> json) =>
      _$CounterTaskFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$CounterTaskToJson(this);

  @override
  List<Object?> get props =>
      [title, description, routine, taskCredits, maxValue, currentValue];

  @override
  bool? get stringify => true;
}
