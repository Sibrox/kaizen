import 'package:equatable/equatable.dart';
import 'package:kaizen/models/reward/reward.dart';
part 'shop.g.dart';

class Shop extends Equatable {
  final Reward? milestone;
  final List<Reward> rewards;

  const Shop({
    this.milestone,
    required this.rewards,
  });

  factory Shop.fromJson(Map<String, dynamic> json) => _$ShopFromJson(json);
  Map<String, dynamic> toJson() => _$ShopToJson(this);

  factory Shop.withNewMilestone(Shop shop, Reward newMilestone) {
    var rewards =
        shop.rewards.where((element) => element != newMilestone).toList();

    if (shop.milestone != null) {
      rewards.add(shop.milestone!);
    }

    return Shop(milestone: newMilestone, rewards: rewards);
  }

  factory Shop.withNewReward(Shop shop, Reward newReward) {
    return Shop(
        milestone: shop.milestone, rewards: [...shop.rewards, newReward]);
  }

  factory Shop.deleteReward(Shop shop, Reward toRemove) {
    return Shop(
        milestone: shop.milestone,
        rewards: shop.rewards.where((element) => element != toRemove).toList());
  }

  @override
  List<Object?> get props => [milestone, rewards];
}
