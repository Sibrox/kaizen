import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../question.dart';

part 'second_survey_event.dart';
part 'second_survey_state.dart';

class SecondSurveyBloc extends Bloc<SecondSurveyEvent, SecondSurveyState> {
  SecondSurveyBloc() : super(const SecondSurveyState({})) {
    on<EventLoadSecondSurvey>((event, emit) async {
      Map<String, List<Question>> secondSurvey = {};

      String json = await rootBundle.loadString(event.path);

      Map<String, dynamic> secondQuestions = jsonDecode(json);

      for (var secondQuestion in secondQuestions.entries) {
        secondSurvey[secondQuestion.key] = [];

        for (var question in secondQuestion.value) {
          secondSurvey[secondQuestion.key]!.add(Question.fromJson(question));
        }
      }

      emit(SecondSurveyState(secondSurvey));
    });
    on<EventSelectQuestions>((event, emit) {
      Map<String, List<Question>> newState = Map.from(state.secondQuestions);
      newState
          .removeWhere((key, value) => !event.selectedQuestions.contains(key));
      emit(SecondSurveyState(newState));
    });
    on<EventChangeValue>((event, emit) {
      Map<String, List<Question>> newState = Map.fromEntries(state
          .secondQuestions.entries
          .map((entry) => MapEntry(entry.key, List.from(entry.value))));
      Question newQuestion = state.secondQuestions[event.key]![event.index]
          .copyWith(value: event.value);

      newState[event.key]![event.index] = newQuestion;
      emit(SecondSurveyState(newState));
    });
  }
}
