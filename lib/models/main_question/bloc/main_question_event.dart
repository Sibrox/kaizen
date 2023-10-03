part of 'main_survey_bloc.dart';

abstract class MainQuestionEvent {

  const MainQuestionEvent();

}

class EventToggleMainQuestion extends MainQuestionEvent{

  int index;

  EventToggleMainQuestion(this.index);
}
