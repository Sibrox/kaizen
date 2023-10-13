import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaizen/models/second_survey/view/second_question_widget.dart';
import '../models/second_survey/bloc/second_survey_bloc.dart';
import '../models/second_survey/question.dart';

class SecondSurveyWidget extends StatelessWidget {
  final Map<String, List<Question>> secondSurveyQuestions;

  const SecondSurveyWidget({super.key, required this.secondSurveyQuestions});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.fill,
            image: ExactAssetImage("assets/images/main_survey_background.jpg"),
          )),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
            child: Container(
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
            ),
          ),
        ),
        ListView.separated(
          padding: const EdgeInsetsDirectional.all(30),
          physics: const BouncingScrollPhysics(),
          itemCount: secondSurveyQuestions.length,
          itemBuilder: (BuildContext context, int index) {
            String key = secondSurveyQuestions.keys.elementAt(index);
            List<Question>? questions = secondSurveyQuestions[key];

            return ListTile(
              title: Text(key),
              subtitle: Column(
                  children: questions!
                      .asMap()
                      .entries
                      .map((entry) => SecondQuestionWidget(
                            question: entry.value,
                            onChanged: (value) {
                              BlocProvider.of<SecondSurveyBloc>(context).add(
                                  EventChangeValue(
                                      key: key,
                                      value: value,
                                      index: entry.key));
                            },
                          ))
                      .toList()),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
        ),
        Positioned(
          bottom: 15,
          right: (MediaQuery.of(context).size.width - 100) / 2,
          child: GestureDetector(
            onTap: () {
              //TODO: create the final prompt and send it to AI;
            },
            child: Container(
              alignment: Alignment.center,
              width: 100,
              height: 40,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.blueAccent),
              child: const Text("Fine"),
            ),
          ),
        )
      ],
    );
  }
}
