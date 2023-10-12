import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaizen/models/main_survey/main_question.dart';
import 'package:kaizen/screens/second_survey.dart';
import 'package:kaizen/screens/waiting_screen.dart';
import '../models/main_survey/view/main_question_widget.dart';
import '../models/second_survey/bloc/second_survey_bloc.dart';

class MainSurveyWidget extends StatelessWidget {
  final List<MainQuestion> mainQuestions;

  const MainSurveyWidget({super.key, required this.mainQuestions});

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
          shrinkWrap: true,
          itemCount: mainQuestions.length,
          itemBuilder: (BuildContext context, int index) {
            return MainQuestionWidget(
              index: index,
              question: mainQuestions[index],
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
              List<String> questionForSecondSurvey = [];
              for (MainQuestion question in mainQuestions) {
                question.value == true
                    ? questionForSecondSurvey.add(question.text)
                    : null;
              }

              if (questionForSecondSurvey.isNotEmpty) {
                SecondSurveyBloc prova =
                    BlocProvider.of<SecondSurveyBloc>(context);
                prova.add(EventSelectQuestions(questionForSecondSurvey));

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BlocProvider(
                              create: (BuildContext context) => prova,
                              child: Scaffold(
                                body: WaitingScreen<SecondSurveyBloc,
                                    SecondSurveyState>(
                                  buildWhen: (state) =>
                                      state.secondQuestions.isNotEmpty,
                                  builder: (state) => SecondSurveyWidget(
                                      secondSurveyQuestions:
                                          state.secondQuestions),
                                ),
                              ),
                            )));
              }
            },
            child: Container(
              alignment: Alignment.center,
              width: 100,
              height: 40,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.blueAccent),
              child: const Text("Continua"),
            ),
          ),
        )
      ],
    );
  }
}
