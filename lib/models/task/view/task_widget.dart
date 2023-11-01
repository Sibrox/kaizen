import 'package:flutter/widgets.dart';
import 'package:kaizen/models/task/task.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({super.key, required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: const Color.fromARGB(255, 255, 145, 56),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(task.title),
              Text(task.description),
              Text(task.routine.toString()),
              Text('${task.taskCredits}'),
              Text('${task.isDone}'),
            ],
          ),
        ],
      ),
    );
  }
}
