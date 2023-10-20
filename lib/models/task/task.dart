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

  const Task(
      {required this.title,
      required this.description,
      required this.routine,
      required this.taskCredits});

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  Map<String, dynamic> toJson() => _$TaskToJson(this);

  @override
  String toString() {
    return const JsonEncoder.withIndent('  ').convert(toJson());
  }

  @override
  List<Object?> get props => [title, description, routine, taskCredits];
}
