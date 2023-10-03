part of 'main_question_bloc.dart';

abstract class MainQuestionEvent {

  const MainQuestionEvent();

}

class EventToggleMainQuestion extends MainQuestionEvent{

  const EventToggleMainQuestion();
}
