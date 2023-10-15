import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaizen/models/common/reward/reward.dart';
import 'package:kaizen/models/shop/shop.dart';

part 'shop_event.dart';

class ShopBloc extends Bloc<ShopEvent, Shop> {
  ShopBloc() : super(const Shop(milestone: null, rewards: [])) {
    on<SetMilestoneEvent>((event, emit) {});

    on<NewRewardEvent>((event, emit) {});

    on<DeleteRewardEvent>((event, emit) {});
  }
}
