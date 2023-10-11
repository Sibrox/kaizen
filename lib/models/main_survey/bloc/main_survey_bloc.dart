import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import '../main_question.dart';

part 'main_survey_event.dart';

part 'main_survey_state.dart';

class MainSurveyBloc extends Bloc<MainQuestionEvent, MainSurveyState> {
  MainSurveyBloc() : super(MainSurveyState([])) {
    on<EventToggleMainQuestion>((event, emit) {
      List<MainQuestion> newState = List.from(state.mainQuestions);
      newState[event.index] = MainQuestion(
          text: newState[event.index].text,
          value: !newState[event.index].value);
      emit(MainSurveyState(newState));
    });
    on<EventAddQuestion>((event, emit) {
      List<MainQuestion> newState = List.from(state.mainQuestions);
      newState.insert(
          newState.length - 1, MainQuestion(text: event.text, value: true));
      emit(MainSurveyState(newState));
    });
    on<EventLoadInfos>((event, emit) async {
      List<MainQuestion> mainQuestions = [];

      String json = await rootBundle.loadString(event.path);
      List<dynamic> questions = jsonDecode(json);

      for (var question in questions) {
        mainQuestions.add(MainQuestion.fromJson(question));
      }

      emit(MainSurveyState(mainQuestions));
    },);
  }
}
