import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaizen/models/task/view/task_widget.dart';
import 'package:kaizen/models/task_manager/bloc/task_manager_bloc.dart';
import 'package:kaizen/models/task_manager/task_manager.dart';

class TaskManagerScreen extends StatefulWidget {
  const TaskManagerScreen({super.key});

  @override
  State<TaskManagerScreen> createState() => _TaskManagerScreenState();
}

class _TaskManagerScreenState extends State<TaskManagerScreen> {
  late bool isDragging, inRemove;

  @override
  void initState() {
    isDragging = inRemove = false;
    super.initState();
  }

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
                return LongPressDraggable(
                    onDragStarted: () {
                      setState(() {
                        isDragging = true;
                      });
                    },
                    onDragEnd: (dragDetails) {
                      setState(() {
                        isDragging = inRemove = false;
                      });
                    },
                    data: index,
                    dragAnchorStrategy: pointerDragAnchorStrategy,
                    childWhenDragging: ColorFiltered(
                      colorFilter: const ColorFilter.mode(
                        Colors.grey,
                        BlendMode.saturation,
                      ),
                      child:
                          TaskWidget(task: taskManagerBloc.state.tasks[index]),
                    ),
                    feedback: const SizedBox(
                      height: 100,
                      width: 100,
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: Icon(Icons.remove),
                      ),
                    ),
                    child:
                        TaskWidget(task: taskManagerBloc.state.tasks[index]));
              },
            ),
          ),
          DragTarget<int>(builder: (BuildContext context,
              List<dynamic> accepted, List<dynamic> rejected) {
            return Visibility(
              visible: isDragging,
              child: AnimatedContainer(
                  width: MediaQuery.of(context).size.width,
                  color: inRemove ? Colors.red : Colors.white,
                  duration: const Duration(milliseconds: 500),
                  child: const Icon(
                    Icons.remove_circle_outlined,
                    size: 70,
                  )),
            );
          }, onAccept: (index) {
            taskManagerBloc.add(DeleteTaskEvent(index));
          }, onMove: (dragDetails) {
            setState(() {
              inRemove = true;
            });
          }, onLeave: (dragDetails) {
            setState(() {
              inRemove = false;
            });
          }),
        ],
      );
    });
  }
}
