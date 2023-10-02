// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      credits: json['credits'] as int,
      rewardsHistory: json['rewardsHistory'],
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'credits': instance.credits,
      'rewardsHistory': instance.rewardsHistory,
    };
