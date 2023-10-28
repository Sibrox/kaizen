import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaizen/models/task/view/task_widget.dart';
import 'package:kaizen/models/task_manager/bloc/task_manager_bloc.dart';
import 'package:kaizen/models/task_manager/task_manager.dart';

class TaskManagerScreen extends StatelessWidget {
  const TaskManagerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskManagerBloc, TaskManager>(builder: (context, state) {
      TaskManagerBloc taskManagerBloc =
          BlocProvider.of<TaskManagerBloc>(context);

      return Column(
        children: [
          Expanded(
            flex: 4,
            child: ListView.builder(
              itemCount: taskManagerBloc.state.tasks.length,
              itemBuilder: (BuildContext context, int index) {
                return TaskWidget(task: taskManagerBloc.state.tasks[index]);
              },
            ),
          ),
        ],
      );
    });
  }
}
