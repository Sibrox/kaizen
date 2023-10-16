import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaizen/models/reward/reward.dart';
import 'package:kaizen/models/user/user.dart';

part 'user_event.dart';

class UserBloc extends Bloc<UserEvent, User> {
  UserBloc(User user) : super(user) {
    on<BuyRewardEvent>(
        (event, emit) => emit(User.buyReward(state, event.reward)));
  }
}
