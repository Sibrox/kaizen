import 'package:bloc_test/bloc_test.dart';
import 'package:kaizen/models/main_survey/bloc/main_survey_bloc.dart';
import 'package:kaizen/models/main_survey/main_question.dart';
import 'package:test/test.dart';

void main() {
  group("MainSurveyBloc", () {
    test("Initial state", () {
      List<MainQuestion> mainQuestions = [];
      MainSurveyBloc surveyBloc = MainSurveyBloc(mainQuestions);
      mainQuestions.add(MainQuestion(text: "Test", value: false));

      surveyBloc.state.mainQuestions == mainQuestions;
    });

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
          MainQuestionState assertState = MainQuestionState(mainQuestions);
          return [assertState];
        });

    blocTest("AddQuestionEvent",
        build: () {
          List<MainQuestion> mainQuestions = [];
          mainQuestions.add(MainQuestion(text: "Test", value: false));
          mainQuestions.add(MainQuestion(text: "Altro", value: false));
          MainSurveyBloc surveyBloc = MainSurveyBloc(mainQuestions);
          return surveyBloc;
        },
        act: (bloc) => bloc.add(EventAddQuestion("AddedTest")),
        expect: () {
          List<MainQuestion> mainQuestions = [];
          mainQuestions.add(MainQuestion(text: "Test", value: false));
          mainQuestions.add(MainQuestion(text: "AddedTest", value: true));
          mainQuestions.add(MainQuestion(text: "Altro", value: false));
          MainQuestionState assertState = MainQuestionState(mainQuestions);
          return [assertState];
        });
  });
}
