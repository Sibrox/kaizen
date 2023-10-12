import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaizen/models/second_survey/bloc/second_survey_bloc.dart';
import 'package:kaizen/models/second_survey/question.dart';
import 'package:kaizen/models/second_survey/view/second_question_widget.dart';
import 'package:kaizen/screens/second_survey.dart';
import 'package:kaizen/screens/waiting_screen.dart';
import 'package:kaizen/screens/main_survey.dart';
import 'models/main_survey/bloc/main_survey_bloc.dart';

void main() {
  runApp(const Kaizen());
}

class Kaizen extends StatefulWidget {
  const Kaizen({super.key});

  @override
  State<Kaizen> createState() => _KaizenState();
}

class _KaizenState extends State<Kaizen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kaizen',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: MultiBlocProvider(
            providers: [
              BlocProvider<MainSurveyBloc>(
                  create: (context) => MainSurveyBloc()
                    ..add(EventLoadInfos(
                        "assets/jsons/ita/main_questions.json"))),
              BlocProvider<SecondSurveyBloc>(
                  lazy: false,
                  create: (context) => SecondSurveyBloc()
                    ..add(EventLoadSecondSurvey(
                        "assets/jsons/ita/second_questions.json"))),
            ],
            child: WaitingScreen<MainSurveyBloc, MainSurveyState>(
              builder: (state) => MainSurveyWidget(
                mainQuestions: state.mainQuestions,
              ),
              buildWhen: (state) => state.mainQuestions.isNotEmpty,
            )),
      ),
    );
  }
}
