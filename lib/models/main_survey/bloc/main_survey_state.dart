part of 'main_survey_bloc.dart';

class MainQuestionState {
  final List<MainQuestion> mainQuestions;

  const MainQuestionState(this.mainQuestions);

  @override
  bool operator ==(Object other) {
    return other is MainQuestionState &&
        listEquals(mainQuestions, other.mainQuestions);
  }

  @override
  int get hashCode => mainQuestions.hashCode;
}
