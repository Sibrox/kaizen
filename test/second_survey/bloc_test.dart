import 'package:bloc_test/bloc_test.dart';
import 'package:kaizen/models/second_survey/bloc/second_survey_bloc.dart';
import 'package:kaizen/models/second_survey/question.dart';

void main() {
  blocTest("EventLoadInfos",
      build: () => SecondSurveyBloc(),
      act: (bloc) {
        Map<String, List<Question>> secondQuestions = {
          "Text": [
            const Question(text: "Prova", max: 10),
            const Question(text: "Test", max: 5)
          ]
        };

        bloc.add(EventLoadSecondSurvey(secondQuestions));
      },
      expect: () => [
            const SecondSurveyState({
              "Text": [
                Question(text: "Prova", max: 10),
                Question(text: "Test", max: 5)
              ]
            })
          ]);
}
