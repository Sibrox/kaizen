part of 'shop_bloc.dart';

sealed class ShopEvent {
  const ShopEvent();
}

class SetMilestoneEvent extends ShopEvent {
  final int index;

  const SetMilestoneEvent(this.index);
}

class NewRewardEvent extends ShopEvent {
  final Reward reward;

  const NewRewardEvent(this.reward);
}

class DeleteRewardEvent extends ShopEvent {
  final int toRemove;

  const DeleteRewardEvent(this.toRemove);
}
