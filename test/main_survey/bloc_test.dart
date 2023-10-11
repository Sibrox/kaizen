import 'dart:convert';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kaizen/models/main_survey/bloc/main_survey_bloc.dart';
import 'package:kaizen/models/main_survey/main_question.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  blocTest("EventLoadInfosTest", build: () {
    return MainSurveyBloc();
  }, act: (bloc) {
    bloc.add(EventLoadInfos("assets/jsons/ita/main_questions.json"));
  }, expect: () async {
    List<MainQuestion> mainQuestions = [];
    Future<String> json =
        rootBundle.loadString("assets/jsons/ita/main_questions.json");
    List<dynamic> list = jsonDecode(await json);

    for (var question in list) {
      mainQuestions.add(MainQuestion.fromJson(question));
    }
    return [MainSurveyState(mainQuestions)];
  });

  /*
    blocTest("Toggle event",
        build: () {
          List<MainQuestion> mainQuestions = [];
          mainQuestions.add(MainQuestion(text: "Test", value: false));
          MainSurveyBloc surveyBloc = MainSurveyBloc(mainQuestions);
          return surveyBloc;
        },
        act: (bloc) => bloc.add(EventToggleMainQuestion(0)),
        expect: () {
          List<MainQuestion> mainQuestions = [];
          mainQuestions.add(MainQuestion(text: "Test", value: true));
          MainSurveyState assertState = MainSurveyState(mainQuestions);
          return [assertState];
        });

    blocTest("AddQuestionEvent",
        build: () {
          List<MainQuestion> mainQuestions = [
            MainQuestion(text: "Test", value: false),
            MainQuestion(text: "Altro", value: false)
          ];

          return MainSurveyBloc(mainQuestions);
        },
        act: (bloc) => bloc.add(EventAddQuestion("AddedTest")),
        expect: () {
          List<MainQuestion> mainQuestions = [];
          mainQuestions.add(MainQuestion(text: "Test", value: false));
          mainQuestions.add(MainQuestion(text: "AddedTest", value: true));
          mainQuestions.add(MainQuestion(text: "Altro", value: false));
          MainSurveyState assertState = MainSurveyState(mainQuestions);
          return [assertState];
        });

    blocTest("Toggle question two times", build: () {
      List<MainQuestion> mainQuestions = [
        MainQuestion(text: "Test", value: false),
        MainQuestion(text: "Altro", value: false)
      ];
      return MainSurveyBloc(mainQuestions);
    }, act: (bloc) {
      bloc.add(EventToggleMainQuestion(1));
      bloc.add(EventToggleMainQuestion(1));
    }, expect: () {
      List<MainQuestion> firstState = [
        MainQuestion(text: "Test", value: false),
        MainQuestion(text: "Altro", value: true),
      ];
      List<MainQuestion> secondState = [
        MainQuestion(text: "Test", value: false),
        MainQuestion(text: "Altro", value: false),
      ];
      return [MainSurveyState(firstState), MainSurveyState(secondState)];
    });

     */
}
