import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaizen/models/main_question/bloc/main_question_bloc.dart';

class MainQuestionWidget extends StatelessWidget {
  const MainQuestionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<MainQuestionBloc,MainQuestionState>(
      builder: (context,state){
        return  Row(
          children: [
            Text(state.mainQuestion.text!),
            GestureDetector(
              child: Text("${state.mainQuestion.value!}"),
              onTap: (){
                context.read<MainQuestionBloc>().add(const EventToggleMainQuestion());
              },
            )
          ],
        );
      },

    );
  }
}
