import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaizen/models/common/reward/reward.dart';
import 'package:kaizen/models/shop/shop.dart';

part 'shop_event.dart';

class ShopBloc extends Bloc<ShopEvent, Shop> {
  ShopBloc({Shop? initialState})
      : super(initialState ?? const Shop(milestone: null, rewards: [])) {
    on<SetMilestoneEvent>((event, emit) {
      if (event.index >= state.rewards.length) return;
      emit(Shop.withNewMilestone(state, state.rewards[event.index]));
    });

    on<NewRewardEvent>((event, emit) {
      emit(Shop.withNewReward(state, event.reward));
    });

    on<DeleteRewardEvent>((event, emit) {});
  }
}
