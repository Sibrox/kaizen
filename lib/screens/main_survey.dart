import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaizen/models/main_question/bloc/main_survey_bloc.dart';
import 'package:kaizen/models/main_question/main_question.dart';

class MainSurveyWidget extends StatelessWidget {

  MainSurveyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<MainSurveyBloc,MainQuestionState>(
      builder: (context,state){
        return ListView.builder(
          itemCount: state.mainQuestions.length,
          itemBuilder: (BuildContext context, int index){
            return Row(
              children: [
                Text("${state.mainQuestions[index].text}"),
                GestureDetector(
                  child: Text("${state.mainQuestions[index].value}"),
                  onTap: (){

                    context.read<MainSurveyBloc>().add(EventToggleMainQuestion(index));
                  },
                )
              ],
            );
          },
        );
      },
    );
  }
}
