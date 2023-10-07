import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
part 'reward.g.dart';

@JsonSerializable()
class Reward {
  static const maxRating = 5;
  static const minRating = 0;

  final String title;
  final String description;
  final int price;
  final int rating;

  const Reward(
      {required this.title,
      required this.price,
      required this.rating,
      this.description = ""});

  factory Reward.fromJson(Map<String, dynamic> json) => _$RewardFromJson(json);

  Map<String, dynamic> toJson() => _$RewardToJson(this);

  @override
  bool operator ==(Object other) {
    return other is Reward &&
        title == other.title &&
        price == other.price &&
        rating == other.rating &&
        description == other.description;
  }

  @override
  int get hashCode => title.hashCode;

  @override
  String toString() {
    return const JsonEncoder.withIndent('  ').convert(toJson());
  }
}
