import 'package:kaizen/models/task/routine.enum.dart';

abstract class Task {
  final String title;
  final String description;
  final int taskCredits;
  final Routine routine;
  final bool isDone;

  const Task(
      {required this.title,
      required this.description,
      required this.taskCredits,
      required this.isDone,
      required this.routine});

  Task interact();

  Map<String, dynamic>? toJson();
}
