part of 'main_survey_bloc.dart';

class MainSurveyState {
  final List<MainQuestion> mainQuestions;

  MainSurveyState(this.mainQuestions);

  @override
  bool operator ==(Object other) {
    return other is MainSurveyState &&
        listEquals(mainQuestions, other.mainQuestions);
  }

  @override
  int get hashCode => mainQuestions.hashCode;
}
