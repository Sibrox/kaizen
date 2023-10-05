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

    MainQuestionState state1 = MainQuestionState(mainQuestions1);
    MainQuestionState state2 = MainQuestionState(mainQuestions2);

    expect(state1 == state2, false);
  });

  test("Test same mainQuestionState", () {
    List<MainQuestion> mainQuestions1 = [
      MainQuestion(text: "Vuoi dimagrire?", value: false)
    ];

    MainQuestionState state1 = MainQuestionState(mainQuestions1);

    expect(state1 == state1, true);
  });

  test("Test two different mainQuestionState with the same value", () {
    List<MainQuestion> mainQuestions1 = [
      MainQuestion(text: "Vuoi dimagrire?", value: false)
    ];

    List<MainQuestion> mainQuestions2 = [
      MainQuestion(text: "Vuoi dimagrire?", value: false)
    ];

    MainQuestionState state1 = MainQuestionState(mainQuestions1);
    MainQuestionState state3 = MainQuestionState(mainQuestions2);

    expect(state1 == state3, true);
  });
}
