part of 'second_survey_bloc.dart';

abstract class SecondSurveyEvent {}

class EventChangeValue extends SecondSurveyEvent {
  int index;

  EventChangeValue(this.index);
}

class EventLoadSecondSurvey extends SecondSurveyEvent {
  String path;

  EventLoadSecondSurvey(this.path);
}
