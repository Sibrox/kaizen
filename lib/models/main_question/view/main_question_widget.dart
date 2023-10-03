import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaizen/models/main_question/bloc/main_survey_bloc.dart';

class MainQuestionWidget extends StatelessWidget {
  const MainQuestionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<MainSurveyBloc,MainQuestionState>(
      builder: (context,state){
        return  Row(
          children: [
          ],
        );
      },

    );
  }
}
