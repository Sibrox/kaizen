part of 'second_survey_bloc.dart';

class SecondSurveyState extends Equatable {
  final Map<String, List<Question>> secondQuestions;

  const SecondSurveyState(this.secondQuestions);

  @override
  List<Object?> get props => [secondQuestions];
}
