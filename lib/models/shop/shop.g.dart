// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Shop _$ShopFromJson(Map<String, dynamic> json) => Shop(
    milestone: json['milestone'] as Reward?,
    rewards: json['rewards'] as List<Reward>);

Map<String, dynamic> _$ShopToJson(Shop instance) => <String, dynamic>{
      'milestone': instance.milestone,
      'rewards': instance.rewards,
    };
