import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import '../main_question.dart';

part 'main_survey_event.dart';

part 'main_survey_state.dart';

class MainSurveyBloc extends Bloc<MainQuestionEvent, MainQuestionState> {
  MainSurveyBloc(List<MainQuestion> mainQuestions)
      : super(MainQuestionState(mainQuestions)) {
    on<EventToggleMainQuestion>((event, emit) {
      List<MainQuestion> newState = List.from(state.mainQuestions);
      newState[event.index] = MainQuestion(
          text: newState[event.index].text,
          value: !newState[event.index].value);
      emit(MainQuestionState(newState));
    });
    on<EventAddQuestion>((event, emit) {
      List<MainQuestion> newState = List.from(state.mainQuestions);
      newState.insert(
          newState.length - 1, MainQuestion(text: event.text, value: true));
      emit(MainQuestionState(newState));
    });
  }
}
