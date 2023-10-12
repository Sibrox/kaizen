import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaizen/models/second_survey/bloc/second_survey_bloc.dart';
import '../question.dart';

class SecondQuestionWidget extends StatelessWidget {
  final String mapKey;
  final Question question;

  const SecondQuestionWidget(
      {super.key, required this.mapKey, required this.question});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            color: Colors.black.withAlpha(15)),
        padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
        margin: const EdgeInsetsDirectional.only(top: 10, start: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 10,
              child: Text(
                question.text,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            Expanded(
              flex: 7,
              child: Slider(
                value: question.value,
                max: question.max,
                divisions: question.divisions,
                onChanged: (double value) {
                  BlocProvider.of<SecondSurveyBloc>(context).add(
                      EventChangeValue(
                          key: mapKey, value: value, index: question.index));
                },
              ),
            ),
            Expanded(flex: 1, child: Text("${question.value}")),
          ],
        ));
  }
}
