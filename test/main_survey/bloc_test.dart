import 'package:kaizen/utilities/bloc_test_custom.dart';
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
      MainQuestion(text: "Test", value: false)
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
          MainQuestion(text: "Test", value: false),
        ];
        List<MainQuestion> mainQuestionsToggled = [
          MainQuestion(text: "Test", value: true),
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
          MainQuestion(text: "Test", value: false)
        ];
        MainSurveyState initState = MainSurveyState(initQuestions);
        List<MainQuestion> postAddedQuestions = [
          MainQuestion(text: "AddedTest", value: true),
          MainQuestion(text: "Test", value: false)
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
          MainQuestion(text: "Test", value: false),
        ];
        List<MainQuestion> firstState = [
          MainQuestion(text: "Test", value: true),
        ];
        List<MainQuestion> secondState = [
          MainQuestion(text: "Test", value: false),
        ];
        return [MainSurveyState(initState),MainSurveyState(firstState), MainSurveyState(secondState)];
      });
}
