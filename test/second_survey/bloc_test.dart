import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kaizen/models/second_survey/bloc/second_survey_bloc.dart';
import 'package:kaizen/models/second_survey/question.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  blocTest("EventLoadInfos",
      build: () => SecondSurveyBloc(),
      act: (bloc) {
        bloc.add(EventLoadSecondSurvey(
            "assets/jsons/test/test_second_question.json"));
      },
      expect: () => [
            const SecondSurveyState({
              "Questo è un test di prova?": [
                Question(
                    text: "Credo proprio di si",
                    max: 10,
                    divisions: 10,
                    index: 0),
                Question(text: "Siamo nel Matrix?", max: 10, index: 1)
              ],
              "Test": [
                Question(
                    text: "Credo proprio di si",
                    max: 10,
                    divisions: 10,
                    index: 0),
                Question(text: "Siamo nel Matrix?", max: 10, index: 1)
              ]
            })
          ]);

  blocTest("EventSelectQuestions",
      build: () => SecondSurveyBloc(),
      act: (bloc) async {
        List<String> selectedQuestions = ["Questo è un test di prova?"];

        bloc.add(EventLoadSecondSurvey(
            "assets/jsons/test/test_second_question.json"));
        await Future.delayed(const Duration(seconds: 1));
        bloc.add(EventSelectQuestions(selectedQuestions));
      },
      expect: () {
        SecondSurveyState initState = const SecondSurveyState({
          "Questo è un test di prova?": [
            Question(
                text: "Credo proprio di si", max: 10, divisions: 10, index: 0),
            Question(text: "Siamo nel Matrix?", max: 10, index: 1)
          ],
          "Test": [
            Question(
                text: "Credo proprio di si", max: 10, divisions: 10, index: 0),
            Question(text: "Siamo nel Matrix?", max: 10, index: 1)
          ]
        });

        SecondSurveyState afterEventState = const SecondSurveyState({
          "Questo è un test di prova?": [
            Question(
                text: "Credo proprio di si", max: 10, divisions: 10, index: 0),
            Question(text: "Siamo nel Matrix?", max: 10, index: 1)
          ],
        });
        return [initState, afterEventState];
      });

  blocTest("EventChangeValue",
      build: () => SecondSurveyBloc(),
      act: (bloc) async {
        bloc.add(EventLoadSecondSurvey(
            "assets/jsons/test/test_second_question.json"));
        await Future.delayed(const Duration(seconds: 1));
        bloc.add(EventChangeValue(key: "Test", index: 1, value: 10));
      },
      expect: () {
        SecondSurveyState initState = const SecondSurveyState({
          "Questo è un test di prova?": [
            Question(
                text: "Credo proprio di si", max: 10, divisions: 10, index: 0),
            Question(text: "Siamo nel Matrix?", max: 10, index: 1)
          ],
          "Test": [
            Question(
                text: "Credo proprio di si", max: 10, divisions: 10, index: 0),
            Question(text: "Siamo nel Matrix?", max: 10, index: 1)
          ]
        });

        SecondSurveyState afterEventState = const SecondSurveyState({
          "Questo è un test di prova?": [
            Question(
                text: "Credo proprio di si", max: 10, divisions: 10, index: 0),
            Question(text: "Siamo nel Matrix?", max: 10, index: 1)
          ],
          "Test": [
            Question(
                text: "Credo proprio di si", max: 10, divisions: 10, index: 0),
            Question(text: "Siamo nel Matrix?", max: 10, value: 10, index: 1),
          ]
        });

        return [initState, afterEventState];
      });
}
