part of 'main_survey_bloc.dart';

abstract class MainQuestionEvent {
  const MainQuestionEvent();
}

class EventToggleMainQuestion extends MainQuestionEvent {
  int index;

  EventToggleMainQuestion(this.index);
}

class EventAddQuestion extends MainQuestionEvent {
  String text;

  EventAddQuestion(this.text);
}

class EventLoadInfos extends MainQuestionEvent {
  String path;

  EventLoadInfos(this.path);
}
