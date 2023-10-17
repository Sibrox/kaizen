import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'reward.g.dart';

@JsonSerializable()
class Reward extends Equatable {
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
  String toString() {
    return const JsonEncoder.withIndent('  ').convert(toJson());
  }

  @override
  List<Object?> get props => [title, price, rating];
}
