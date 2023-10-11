import 'package:kaizen/models/main_survey/bloc/main_survey_bloc.dart';
import 'package:kaizen/models/main_survey/main_question.dart';
import 'package:test/test.dart';

void main() {
  test("Test two different mainQuestionState", () {
    List<MainQuestion> mainQuestions1 = [
      MainQuestion(text: "Vuoi dimagrire?", value: false)
    ];
    List<MainQuestion> mainQuestions2 = [
      MainQuestion(text: "Vuoi dimagrire?", value: true)
    ];

    assert(MainSurveyState(mainQuestions1) != MainSurveyState(mainQuestions2));
  });

  test("Test same mainQuestionState", () {
    List<MainQuestion> mainQuestions1 = [
      MainQuestion(text: "Vuoi dimagrire?", value: false)
    ];

    MainSurveyState state = MainSurveyState(mainQuestions1);
    assert(state == state);
  });

  test("Test two different mainQuestionState with the same value", () {
    List<MainQuestion> mainQuestions1 = [
      MainQuestion(text: "Vuoi dimagrire?", value: false)
    ];

    List<MainQuestion> mainQuestions2 = [
      MainQuestion(text: "Vuoi dimagrire?", value: false)
    ];

    assert(MainSurveyState(mainQuestions1) == MainSurveyState(mainQuestions2));
  });
}
