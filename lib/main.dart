import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaizen/models/second_survey/bloc/second_survey_bloc.dart';
import 'package:kaizen/models/shop/bloc/shop_bloc.dart';
import 'package:kaizen/models/task/counter_task.dart';
import 'package:kaizen/models/task/routine.enum.dart';
import 'package:kaizen/models/task/simple_task.dart';
import 'package:kaizen/models/task_manager/bloc/task_manager_bloc.dart';
import 'package:kaizen/screens/task_manager_screen.dart';
import 'models/main_survey/bloc/main_survey_bloc.dart';

void main() {
  runApp(const Kaizen());
}

class Kaizen extends StatelessWidget {
  const Kaizen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kaizen',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
          body: MultiBlocProvider(providers: [
        BlocProvider<MainSurveyBloc>(
            create: (context) => MainSurveyBloc()
              ..add(EventLoadInfos("assets/jsons/ita/main_questions.json"))),
        BlocProvider<SecondSurveyBloc>(
            lazy: false,
            create: (context) => SecondSurveyBloc()
              ..add(EventLoadSecondSurvey(
                  "assets/jsons/ita/second_questions.json"))),
        BlocProvider<ShopBloc>(lazy: false, create: (context) => ShopBloc()),
        BlocProvider<TaskManagerBloc>(
          lazy: false,
          create: (context) {
            TaskManagerBloc taskBloc = TaskManagerBloc();
            taskBloc.add(const NewTaskEvent(SimpleTask(
                title: "title",
                description: "prova",
                routine: Routine.daily,
                taskCredits: 100)));
            taskBloc.add(const NewTaskEvent(CounterTask(
                title: "Roberto",
                description: "description",
                routine: Routine.daily,
                taskCredits: 200,
                maxValue: 4)));
            taskBloc.add(const NewTaskEvent(SimpleTask(
                title: "provlone",
                description: "prova",
                routine: Routine.daily,
                taskCredits: 100)));

            return taskBloc;
          },
        )
      ], child: const TaskManagerScreen() /*WaitingScreen<MainSurveyBloc, MainSurveyState>(
                builder: (state) => MainSurveyWidget(
                  mainQuestions: state.mainQuestions,
                ),
                buildWhen: (state) => state.mainQuestions.isNotEmpty,
              )*/
              )),
    );
  }
}
