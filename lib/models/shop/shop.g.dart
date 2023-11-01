// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Shop _$ShopFromJson(Map<String, dynamic> json) => Shop(
      milestone: json['milestone'] == null
          ? null
          : Reward.fromJson(json['milestone'] as Map<String, dynamic>),
      rewards: (json['rewards'] as List<dynamic>)
          .map((e) => Reward.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ShopToJson(Shop instance) => <String, dynamic>{
      'milestone': instance.milestone,
      'rewards': instance.rewards,
    };
