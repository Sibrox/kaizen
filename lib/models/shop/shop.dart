import 'package:json_annotation/json_annotation.dart';
import 'package:kaizen/models/common/reward/reward.dart';
part 'shop.g.dart';

@JsonSerializable()
class Shop {
  final Reward milestone;
  final List<Reward> rewards;

  const Shop({
    required this.milestone,
    required this.rewards,
  });

  factory Shop.fromJson(Map<String, dynamic> json) => _$ShopFromJson(json);
  Map<String, dynamic> toJson() => _$ShopToJson(this);
}
