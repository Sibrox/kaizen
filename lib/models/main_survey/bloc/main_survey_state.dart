part of 'main_survey_bloc.dart';

class MainSurveyState extends Equatable {
  final List<MainQuestion> mainQuestions;

  const MainSurveyState(this.mainQuestions);

  @override
  List<Object?> get props => [mainQuestions];
}
