import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaizen/models/reward/reward.dart';
import 'package:kaizen/models/shop/shop.dart';
import 'package:kaizen/utilities/persistence/persistence_manager.dart';

part 'shop_event.dart';

class ShopBloc extends Bloc<ShopEvent, Shop> {
  static const String persistenceKey = "shop";

  ShopBloc({Shop? initialState})
      : super(initialState ?? const Shop(milestone: null, rewards: [])) {
    on<SetMilestoneEvent>((event, emit) {
      if (event.index >= state.rewards.length) return;
      final newState = Shop.withNewMilestone(state, state.rewards[event.index]);
      PersistenceManager().saveData(persistenceKey, newState.toJson());
      emit(newState);
    });

    on<NewRewardEvent>((event, emit) {
      if (state.rewards.contains(event.reward)) return;
      final newState = Shop.withNewReward(state, event.reward);
      PersistenceManager().saveData(persistenceKey, newState.toJson());
      emit(newState);
    });

    on<DeleteRewardEvent>((event, emit) {
      if (event.toRemove >= state.rewards.length) return;
      final newState = Shop.deleteReward(state, state.rewards[event.toRemove]);
      PersistenceManager().saveData(persistenceKey, newState.toJson());
      emit(newState);
    });
  }
}
