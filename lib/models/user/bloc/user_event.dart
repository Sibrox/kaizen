part of 'user_bloc.dart';

sealed class UserEvent {
  const UserEvent();
}

class BuyRewardEvent extends UserEvent {
  final Reward reward;
  const BuyRewardEvent(this.reward);
}
