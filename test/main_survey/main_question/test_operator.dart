import 'package:kaizen/models/main_survey/main_question.dart';
import 'package:test/test.dart';

void main() {
  test("Test two different mainQuestion's values", () {
    assert(MainQuestion(text: "Vuoi dimagrire?", value: false) !=
        MainQuestion(text: "Vuoi dimagrire?", value: true));
  });

  test("Test two different mainQuestion's texts", () {
    assert(MainQuestion(text: "Vuoi mettere massa?", value: true) !=
        MainQuestion(text: "Vuoi dimagrire?", value: true));
  });

  test("Test same mainQuestions", () {
    assert(MainQuestion(text: "Vuoi dimagrire?", value: false) ==
        MainQuestion(text: "Vuoi dimagrire?", value: false));
  });
}
