import 'package:json_annotation/json_annotation.dart';

import 'package:kaizen/models/common/reward.dart';
part 'user.g.dart';

@JsonSerializable()
class User{
  final int credits;
  final List<Reward> rewardsHistory = [];
  // TODO: add tasksHistory when Task model exists

  User({required this.credits, rewardsHistory}) {
    rewardsHistory = rewardsHistory ?? [];
  }

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);

  Map<String, dynamic> toJson(User user) => 
      _$UserToJson(user);
}