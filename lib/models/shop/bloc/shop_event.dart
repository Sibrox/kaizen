part of 'shop_bloc.dart';

sealed class ShopEvent {
  const ShopEvent();
}

class SetMilestoneEvent extends ShopEvent {
  final Reward milestone;

  const SetMilestoneEvent(this.milestone);
}

class NewRewardEvent extends ShopEvent {
  final Reward reward;

  const NewRewardEvent(this.reward);
}

class DeleteRewardEvent extends ShopEvent {
  final int toRemove;

  const DeleteRewardEvent(this.toRemove);
}
