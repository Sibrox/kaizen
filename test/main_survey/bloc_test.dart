import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kaizen/models/main_survey/bloc/main_survey_bloc.dart';
import 'package:kaizen/models/main_survey/main_question.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  blocTest("EventLoadInfosTest", build: () {
    return MainSurveyBloc();
  }, act: (bloc) {
    bloc.add(EventLoadInfos("assets/jsons/test/test_main_question.json"));
  }, expect: () async {
    List<MainQuestion> mainQuestions = [
      const MainQuestion(text: "Test", value: false)
    ];

    return [MainSurveyState(mainQuestions)];
  });

  blocTest("Toggle event",
      build: () => MainSurveyBloc(),
      act: (bloc) async {
        bloc.add(EventLoadInfos("assets/jsons/test/test_main_question.json"));
        await Future.delayed(const Duration(seconds: 1));
        bloc.add(EventToggleMainQuestion(0));
      },
      expect: () {
        List<MainQuestion> mainQuestions = [
          const MainQuestion(text: "Test", value: false),
        ];
        List<MainQuestion> mainQuestionsToggled = [
          const MainQuestion(text: "Test", value: true),
        ];
        MainSurveyState initState = MainSurveyState(mainQuestions);
        MainSurveyState toggleState = MainSurveyState(mainQuestionsToggled);
        return [initState, toggleState];
      });

  blocTest("AddQuestionEvent",
      build: () => MainSurveyBloc(),
      act: (bloc) async {
        bloc.add(EventLoadInfos("assets/jsons/test/test_main_question.json"));
        await Future.delayed(const Duration(seconds: 1));
        bloc.add(EventAddQuestion("AddedTest"));
      },
      expect: () {
        List<MainQuestion> initQuestions = [
          const MainQuestion(text: "Test", value: false)
        ];
        MainSurveyState initState = MainSurveyState(initQuestions);
        List<MainQuestion> postAddedQuestions = [
          const MainQuestion(text: "AddedTest", value: true),
          const MainQuestion(text: "Test", value: false)
        ];
        MainSurveyState afterAddedState = MainSurveyState(postAddedQuestions);
        return [initState, afterAddedState];
      });

  blocTest("Toggle question two times",
      build: () => MainSurveyBloc(),
      act: (bloc) async {
        bloc.add(EventLoadInfos("assets/jsons/test/test_main_question.json"));
        await Future.delayed(const Duration(seconds: 1));
        bloc.add(EventToggleMainQuestion(0));
        bloc.add(EventToggleMainQuestion(0));
      },
      expect: () {
        List<MainQuestion> initState = [
          const MainQuestion(text: "Test", value: false),
        ];
        List<MainQuestion> firstState = [
          const MainQuestion(text: "Test", value: true),
        ];
        List<MainQuestion> secondState = [
          const MainQuestion(text: "Test", value: false),
        ];
        return [
          MainSurveyState(initState),
          MainSurveyState(firstState),
          MainSurveyState(secondState)
        ];
      });
}
