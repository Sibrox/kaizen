import 'dart:convert';

import 'package:kaizen/models/task/counter_task.dart';
import 'package:kaizen/models/task/routine.enum.dart';
import 'package:kaizen/models/task/task.dart';
import 'package:test/test.dart';

void main() {
  group('CounterTask factory', () {
    test('Test factory interact with a new counterTask', () {
      const originalTask = CounterTask(
          title: 'Task',
          description: 'This is a task',
          routine: Routine.daily,
          taskCredits: 5,
          maxValue: 10);

      CounterTask factoryTask = CounterTask.interact(originalTask);

      expect(factoryTask.currentValue, equals(originalTask.currentValue + 1));
      expect(factoryTask.isDone, false);
    });

    test('Test factory interact with a capped currentValue counterTask', () {
      const originalTask = CounterTask(
          title: 'Task',
          description: 'This is a task',
          routine: Routine.daily,
          taskCredits: 5,
          maxValue: 10,
          currentValue: 10);

      CounterTask factoryTask = CounterTask.interact(originalTask);

      expect(factoryTask.currentValue, equals(originalTask.currentValue + 1));
      expect(factoryTask.isDone, true);
    });
  });

  group("Task factory", () {
    test('Test factory interact with a new Task', () {
      const originalTask = Task(
        title: 'Task',
        description: 'This is a task',
        routine: Routine.daily,
        taskCredits: 5,
      );

      Task factoryTask = Task.interact(originalTask);

      expect(factoryTask.isDone, true);
    });
  });
}
