import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaizen/models/main_question/bloc/main_survey_bloc.dart';
import 'package:kaizen/models/main_question/main_question.dart';

class MainQuestionWidget extends StatelessWidget {
  final int index;
  final MainQuestion question;

  const MainQuestionWidget(
      {super.key, required this.index, required this.question});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainSurveyBloc, MainQuestionState>(
      builder: (context, state) {
        return Container(
          height: 70,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              color: Colors.black.withAlpha(15)),
          padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
          child: question.text!.isNotEmpty
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${question.text}",
                      style: const TextStyle(color: Colors.white),
                    ),
                    Checkbox(
                      value: question.value,
                      onChanged: (_) {
                        context
                            .read<MainSurveyBloc>()
                            .add(EventToggleMainQuestion(index));
                      },
                    )
                  ],
                )
              : TextField(
                  decoration: const InputDecoration(
                    hintText: "Altro",
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                  style: const TextStyle(color: Colors.white),
                  onSubmitted: (text) {
                    if (text.isNotEmpty) {
                      context
                          .read<MainSurveyBloc>()
                          .add(EventAddQuestion(text));
                    }
                  },
                ),
        );
      },
    );
  }
}
