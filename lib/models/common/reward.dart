import 'package:json_annotation/json_annotation.dart';
part 'reward.g.dart';

@JsonSerializable()
class Reward {

  static const maxRating = 5;
  static const mixRating = 0;

  final String title;
  final String description;
  final int price;
  final int rating;

  const Reward(
      {required this.title,
      required this.description,
      required this.price,
      required this.rating});

  factory Reward.fromJson(Map<String, dynamic> json) =>
      _$RewardFromJson(json);

  Map<String, dynamic> toJson() => _$RewardToJson(this);
}
