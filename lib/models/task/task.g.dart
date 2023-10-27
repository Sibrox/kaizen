// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json) => Task(
      title: json['title'] as String,
      description: json['description'] as String,
      routine: $enumDecode(_$RoutineEnumMap, json['routine']),
      taskCredits: json['taskCredits'] as int,
    );

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'routine': _$RoutineEnumMap[instance.routine]!,
      'taskCredits': instance.taskCredits,
    };

const _$RoutineEnumMap = {
  Routine.oneshot: 'oneshot',
  Routine.daily: 'daily',
  Routine.weekly: 'weekly',
  Routine.monthly: 'monthly',
};
