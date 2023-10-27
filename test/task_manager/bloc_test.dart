import 'package:bloc_test/bloc_test.dart';
import 'package:kaizen/models/task/routine.enum.dart';
import 'package:kaizen/models/task/task.dart';
import 'package:kaizen/models/task_manager/bloc/task_manager_bloc.dart';
import 'package:kaizen/models/task_manager/task_manager.dart';

void main() {
  blocTest(
    "Test add Task to empty TaskManager",
    build: () => TaskManagerBloc(),
    act: (bloc) => bloc.add(const NewTaskEvent(Task(
        title: "Title",
        description: "Description",
        routine: Routine.weekly,
        taskCredits: 10))),
    expect: () => [
      const TaskManager(tasks: [
        Task(
            title: "Title",
            description: "Description",
            routine: Routine.weekly,
            taskCredits: 10)
      ])
    ],
  );

  blocTest("Test add Task to not empty TaskManager",
      build: () => TaskManagerBloc(
              initialState: const TaskManager(tasks: [
            Task(
                title: "Title1",
                description: "Description",
                routine: Routine.daily,
                taskCredits: 10)
          ])),
      act: (bloc) => bloc.add(const NewTaskEvent(Task(
          title: "Title2",
          description: "Description",
          routine: Routine.weekly,
          taskCredits: 20))),
      expect: () => [
            const TaskManager(tasks: [
              Task(
                  title: "Title1",
                  description: "Description",
                  routine: Routine.daily,
                  taskCredits: 10),
              Task(
                  title: "Title2",
                  description: "Description",
                  routine: Routine.weekly,
                  taskCredits: 20)
            ])
          ]);

  blocTest("Test delete Task from TaskManager",
      build: () => TaskManagerBloc(
              initialState: const TaskManager(tasks: [
            Task(
                title: "Title1",
                description: "Description",
                routine: Routine.daily,
                taskCredits: 10),
            Task(
                title: "Title2",
                description: "Description",
                routine: Routine.weekly,
                taskCredits: 20),
          ])),
      act: (bloc) => bloc.add(const DeleteTaskEvent(1)),
      expect: () => [
            const TaskManager(tasks: [
              Task(
                  title: "Title2",
                  description: "Description",
                  routine: Routine.weekly,
                  taskCredits: 20),
            ])
          ]);

  blocTest("Test delete not existing Task from TaskManager",
      build: () => TaskManagerBloc(
              initialState: const TaskManager(tasks: [
            Task(
                title: "Title1",
                description: "Description",
                routine: Routine.daily,
                taskCredits: 10),
            Task(
                title: "Title2",
                description: "Description",
                routine: Routine.weekly,
                taskCredits: 20),
          ])),
      act: (bloc) => bloc.add(const DeleteTaskEvent(2)),
      expect: () => []);
}
