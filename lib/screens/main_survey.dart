import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaizen/models/main_survey/main_question.dart';
import '../models/main_survey/bloc/main_survey_bloc.dart';
import '../models/main_survey/view/main_question_widget.dart';

class MainSurveyWidget extends StatelessWidget {
  const MainSurveyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainSurveyBloc, MainQuestionState>(
      builder: (context, state) {
        return Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.fill,
                image:
                    ExactAssetImage("assets/images/main_survey_background.jpg"),
              )),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                child: Container(
                  decoration:
                      BoxDecoration(color: Colors.white.withOpacity(0.0)),
                ),
              ),
            ),
            ListView.separated(
              padding: const EdgeInsetsDirectional.all(30),
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.mainQuestions.length,
              itemBuilder: (BuildContext context, int index) {
                return MainQuestionWidget(
                  index: index,
                  question: state.mainQuestions[index],
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
                  List<String?> questionForSecondSurvey = [];
                  for (MainQuestion question in state.mainQuestions) {
                    question.value == true
                        ? questionForSecondSurvey.add(question.text)
                        : null;
                  }
                  //TODO: pass questionForSecondSurvey for build the second survey screen
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 100,
                  height: 40,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.blueAccent),
                  child: const Text("Avanti"),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
