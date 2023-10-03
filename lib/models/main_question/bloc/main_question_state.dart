part of 'main_question_bloc.dart';

class MainQuestionState extends Equatable {

  final MainQuestion mainQuestion;

  const MainQuestionState(this.mainQuestion);

  @override
  List<Object> get props => [mainQuestion];
}

