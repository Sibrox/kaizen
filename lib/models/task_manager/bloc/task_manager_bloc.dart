import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaizen/models/task/task.dart';
import 'package:kaizen/models/task_manager/task_manager.dart';
import 'package:kaizen/utilities/persistence/persistence_manager.dart';

part 'task_manager_event.dart';

class TaskManagerBloc extends Bloc<TaskManagerEvent, TaskManager> {
  static const String persistenceKey = "task_manager";

  TaskManagerBloc({TaskManager? initialState})
      : super(initialState ?? const TaskManager(tasks: [])) {
    on<NewTaskEvent>((event, emit) {
      final newState = TaskManager.withNewTask(state, event.task);
      PersistenceManager()
          .saveData(TaskManagerBloc.persistenceKey, newState.toJson());
      emit(newState);
    });

    on<DeleteTaskEvent>((event, emit) {
      if (event.toDelete >= state.tasks.length) {
        return;
      } else {
        final newState =
            TaskManager.deleteTask(state, state.tasks[event.toDelete]);
        PersistenceManager()
            .saveData(TaskManagerBloc.persistenceKey, newState.toJson());
        emit(newState);
      }
    });
  }
}
