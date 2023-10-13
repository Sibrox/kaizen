import 'package:kaizen/models/main_survey/main_question.dart';
import 'package:test/test.dart';

void main() {
  test("Test two different mainQuestion's values", () {
    assert(const MainQuestion(text: "Vuoi dimagrire?", value: false) !=
        const MainQuestion(text: "Vuoi dimagrire?", value: true));
  });

  test("Test two different mainQuestion's texts", () {
    assert(const MainQuestion(text: "Vuoi mettere massa?", value: true) !=
        const MainQuestion(text: "Vuoi dimagrire?", value: true));
  });

  test("Test same mainQuestions", () {
    assert(const MainQuestion(text: "Vuoi dimagrire?", value: false) ==
        const MainQuestion(text: "Vuoi dimagrire?", value: false));
  });
}
