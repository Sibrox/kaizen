import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaizen/models/reward/reward.dart';
import 'package:kaizen/models/user/user.dart';
import 'package:kaizen/utilities/persistence/persistence.dart';

part 'user_event.dart';

class UserBloc extends Bloc<UserEvent, User> {
  static const String persistenceKey = "user";

  UserBloc(User user) : super(user) {
    on<BuyRewardEvent>((event, emit) {
      final newState = User.buyReward(state, event.reward);
      PersistenceManager().saveData(UserBloc.persistenceKey, newState.toJson());
      emit(newState);
    });
  }
}
