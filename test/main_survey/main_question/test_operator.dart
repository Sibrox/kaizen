import 'package:kaizen/models/main_survey/main_question.dart';
import 'package:test/test.dart';

void main() {
  test("Test two different mainQuestion's values", () {
    MainQuestion mainQuestion1 =
        MainQuestion(text: "Vuoi dimagrire?", value: false);
    MainQuestion mainQuestion2 =
        MainQuestion(text: "Vuoi dimagrire?", value: true);

    expect(mainQuestion1 == mainQuestion2, false);
  });

  test("Test two different mainQuestion's texts", () {
    MainQuestion mainQuestion1 =
        MainQuestion(text: "Vuoi dimagrire?", value: false);
    MainQuestion mainQuestion2 =
        MainQuestion(text: "Vuoi dimagrire?", value: true);

    expect(mainQuestion1 == mainQuestion2, false);
  });

  test("Test same mainQuestions", () {
    MainQuestion mainQuestion1 =
        MainQuestion(text: "Vuoi dimagrire?", value: false);
    MainQuestion mainQuestion3 =
        MainQuestion(text: "Vuoi dimagrire?", value: false);

    expect(mainQuestion1 == mainQuestion3, true);
  });
}
