part of 'second_survey_bloc.dart';

abstract class SecondSurveyEvent {}

class EventChangeValue extends SecondSurveyEvent {
  String key;
  int index;
  int value;

  EventChangeValue({required this.key,required this.index,required this.value});
}

class EventLoadSecondSurvey extends SecondSurveyEvent {
  String path;

  EventLoadSecondSurvey(this.path);
}

class EventSelectQuestions extends SecondSurveyEvent {
  List<String> selectedQuestions;

  EventSelectQuestions(this.selectedQuestions);
}
