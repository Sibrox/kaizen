import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaizen/models/task/task.dart';
import 'package:kaizen/models/task_manager/task_manager.dart';

part 'task_manager_event.dart';

class TaskManagerBloc extends Bloc<TaskManagerEvent, TaskManager> {
  TaskManagerBloc({TaskManager? initialState})
      : super(initialState ?? const TaskManager(tasks: [])) {
    on<NewTaskEvent>((event, emit) {
      emit(TaskManager.withNewTask(state, event.task));
    });

    on<DeleteTaskEvent>((event, emit) {
      if (event.toDelete >= state.tasks.length) {
        return;
      } else {
        emit(TaskManager.deleteTask(state, state.tasks[event.toDelete]));
      }
    });
    on<InteractEvent>((event, emit) {
      emit(TaskManager.interactTask(state, event.index));
    });
  }
}
