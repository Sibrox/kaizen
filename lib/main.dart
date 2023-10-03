import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaizen/models/main_question/main_question.dart';
import 'package:kaizen/models/main_question/bloc/main_question_bloc.dart';
import 'package:kaizen/models/main_question/view/main_question_widget.dart';
import 'package:kaizen/screens/main_survey.dart';

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
      home: const Scaffold(
        body: MainSurvey(),
      ),
    );
  }
}
