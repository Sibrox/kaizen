import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:kaizen/models/task/routine.enum.dart';
part 'task.g.dart';

@JsonSerializable()
class Task extends Equatable {
  final String title;
  final String description;
  final Routine routine;
  final int taskCredits;
  final bool isDone;

  const Task(
      {required this.title,
      required this.description,
      required this.routine,
      required this.taskCredits,
      this.isDone = false});

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  factory Task.interact(Task task) {
    return Task(
        title: task.title,
        description: task.description,
        routine: task.routine,
        taskCredits: task.taskCredits,
        isDone: true);
  }

  Map<String, dynamic> toJson() => _$TaskToJson(this);

  @override
  String toString() {
    return const JsonEncoder.withIndent('  ').convert(toJson());
  }

  @override
  List<Object?> get props => [title, description, routine, taskCredits];
}
