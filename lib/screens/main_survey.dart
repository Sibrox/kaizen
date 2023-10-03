import 'package:flutter/material.dart';
import 'package:kaizen/models/main_question/main_question.dart';
import 'dart:convert';

class MainSurvey extends StatefulWidget {
  const MainSurvey({super.key});

  @override
  State<MainSurvey> createState() => _MainSurveyState();
}

class _MainSurveyState extends State<MainSurvey> {

 List<MainQuestion> mainQuestions = List.empty(growable: true);

  Future<void> initializeQuestions() async {

    String json = await DefaultAssetBundle.of(context).loadString("assets/jsons/main_questions.json");
    List<dynamic> questions = jsonDecode(json);

    for(var question in questions){
      setState(() {
        mainQuestions.add(MainQuestion.fromJson(question));
      });

    }
  }

  @override
  void initState() {
    super.initState();
    initializeQuestions();
  }

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      itemCount: mainQuestions.length,
      itemBuilder: (BuildContext context, int index){

        return Text("${mainQuestions[index].text} ${mainQuestions[index].value}");
      },
    );
  }
}
