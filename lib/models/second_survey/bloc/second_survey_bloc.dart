import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  }
}
