import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:kaizen/models/common/reward/reward.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  int credits;
  List<Reward> rewardsHistory = [];
  // TODO: add tasksHistory when Task model exists

  User({required this.credits, required this.rewardsHistory});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  factory User.buyReward(User user, Reward reward) {
    if (user.credits < reward.price) return user;
    return User(
        credits: user.credits - reward.price,
        rewardsHistory: [...user.rewardsHistory, reward]);
  }

  @override
  bool operator ==(Object other) {
    return other is User && listEquals(rewardsHistory, other.rewardsHistory);
  }

  @override
  int get hashCode => rewardsHistory.hashCode;

  @override
  String toString() {
    return const JsonEncoder.withIndent('  ').convert(toJson());
  }
}
