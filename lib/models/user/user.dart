import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:kaizen/models/reward/reward.dart';
part 'user.g.dart';

@JsonSerializable()
class User extends Equatable {
  final int credits;
  final List<Reward> rewardsHistory;
  // TODO: add tasksHistory when Task model exists

  const User({required this.credits, required this.rewardsHistory});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  factory User.buyReward(User user, Reward reward) {
    if (user.credits < reward.price) return user;
    return User(
        credits: user.credits - reward.price,
        rewardsHistory: [...user.rewardsHistory, reward]);
  }

  @override
  String toString() {
    return const JsonEncoder.withIndent('  ').convert(toJson());
  }

  @override
  List<Object?> get props => [credits, rewardsHistory];
}
