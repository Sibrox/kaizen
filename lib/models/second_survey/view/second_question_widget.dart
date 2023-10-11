import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaizen/models/second_survey/bloc/second_survey_bloc.dart';

class SecondQuestionWidget extends StatelessWidget {
  final String mapKey;
  final String text;
  final int index;
  final int value;

  const SecondQuestionWidget(
      {super.key,
      required this.mapKey,
      required this.index,
      required this.value,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            color: Colors.black.withAlpha(15)),
        padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
            Slider(
              value: value as double,
              onChanged: (double value) {
                BlocProvider.of<SecondSurveyBloc>(context).add(EventChangeValue(
                    key: mapKey, value: value as int, index: index));
              },
            )
          ],
        ));
  }
}
