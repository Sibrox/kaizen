// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reward.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reward _$RewardFromJson(Map<String, dynamic> json) => Reward(
      title: json['title'] as String,
      description: json['description'] as String? ?? "",
      price: json['price'] as int,
      rating: json['rating'] as int,
    );

Map<String, dynamic> _$RewardToJson(Reward instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'rating': instance.rating,
    };
