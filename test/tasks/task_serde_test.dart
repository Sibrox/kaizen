import 'dart:convert';

import 'package:kaizen/models/task/routine.enum.dart';
import 'package:kaizen/models/task/simple_task.dart';
import 'package:test/test.dart';

void main() {
  test('Test task serialization and deserialization', () {
    const originalTask = SimpleTask(
      title: 'Task',
      description: 'This is a task',
      routine: Routine.daily,
      taskCredits: 5,
    );

    // Serialize the Task object to a JSON
    final jsonString = json.encode(originalTask.toJson());

    // Deserialize the JSON back into a Task object
    final decodeMap = json.decode(jsonString);
    final decodedTask = SimpleTask.fromJson(decodeMap);

    expect(decodedTask.title, equals(originalTask.title));
    expect(decodedTask.description, equals(originalTask.description));
    expect(decodedTask.routine, equals(originalTask.routine));
    expect(decodedTask.taskCredits, equals(originalTask.taskCredits));
  });
}
