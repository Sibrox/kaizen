import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:kaizen/models/task/routine.enum.dart';
import 'package:kaizen/models/task/task.dart';
part 'simple_task.g.dart';

@JsonSerializable()
class SimpleTask extends Task implements Equatable {
  const SimpleTask(
      {required title,
      required description,
      required routine,
      required taskCredits,
      isDone = false})
      : super(
            title: title,
            isDone: isDone,
            description: description,
            routine: routine,
            taskCredits: taskCredits);

  @override
  SimpleTask interact() {
    return SimpleTask(
        title: title,
        description: description,
        routine: routine,
        taskCredits: taskCredits,
        isDone: true);
  }

  @override
  Map<String, dynamic> toJson() => _$SimpleTaskToJson(this);

  factory SimpleTask.fromJson(Map<String, dynamic> json) =>
      _$SimpleTaskFromJson(json);

  @override
  List<Object?> get props => [title, description, routine, taskCredits, isDone];

  @override
  bool? get stringify => true;
}
