import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:kaizen/screens/main_survey.dart';

import 'models/main_survey/bloc/main_survey_bloc.dart';
import 'models/main_survey/main_question.dart';

void main() {
  runApp(const Kaizen());
}

class Kaizen extends StatefulWidget {
  const Kaizen({super.key});

  @override
  State<Kaizen> createState() => _KaizenState();
}

class _KaizenState extends State<Kaizen> {
  bool isLoading = true;
  List<MainQuestion> mainQuestions = [];

  Future<void> initializeQuestions() async {
    String json = await DefaultAssetBundle.of(context)
        .loadString("assets/jsons/main_questions.json");
    List<dynamic> questions = jsonDecode(json);

    for (var question in questions) {
      mainQuestions.add(MainQuestion.fromJson(question));
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    initializeQuestions();
  }

  @override
  Widget build(BuildContext context) {
    if (!isLoading) {
      return MaterialApp(
        title: 'Kaizen',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
          body: MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (BuildContext context) =>
                      MainSurveyBloc(mainQuestions)),
            ],
            child: const MainSurveyWidget(),
          ),
        ),
      );
    } else {
      return MaterialApp(
        title: 'Kaizen',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Scaffold(
            body: Text("Sto caricando") //TODO: implement the loading screen,
            ),
      );
    }
  }
}
