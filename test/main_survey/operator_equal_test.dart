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

    assert(
        MainQuestionState(mainQuestions1) != MainQuestionState(mainQuestions2));
  });

  test("Test same mainQuestionState", () {
    List<MainQuestion> mainQuestions1 = [
      MainQuestion(text: "Vuoi dimagrire?", value: false)
    ];

    MainQuestionState state = MainQuestionState(mainQuestions1);
    assert(state == state);
  });

  test("Test two different mainQuestionState with the same value", () {
    List<MainQuestion> mainQuestions1 = [
      MainQuestion(text: "Vuoi dimagrire?", value: false)
    ];

    List<MainQuestion> mainQuestions2 = [
      MainQuestion(text: "Vuoi dimagrire?", value: false)
    ];

    assert(
        MainQuestionState(mainQuestions1) == MainQuestionState(mainQuestions2));
  });
}
