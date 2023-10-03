import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kaizen/models/main_question/main_question.dart';

part 'main_question_event.dart';
part 'main_question_state.dart';

class MainQuestionBloc extends Bloc<MainQuestionEvent, MainQuestionState> {

  MainQuestionBloc(MainQuestion mainQuestion) : super(MainQuestionState(mainQuestion)) {

    on<EventToggleMainQuestion>((event, emit) {
      emit(MainQuestionState(state.mainQuestion.createToggle()));
    });
  }
}
