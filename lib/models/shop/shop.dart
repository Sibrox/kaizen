import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:kaizen/models/common/reward/reward.dart';
part 'shop.g.dart';

@JsonSerializable()
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

    var rewards = shop.rewards.where((element) => element != newMilestone).toList();
    
    if(shop.milestone != null) {
      rewards.add(shop.milestone!);
    }
      
    return Shop(
        milestone: newMilestone,
        rewards: rewards);
  }
  
  @override
  List<Object?> get props => [milestone, rewards];


}
