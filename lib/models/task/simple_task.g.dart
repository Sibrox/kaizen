// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simple_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SimpleTask _$SimpleTaskFromJson(Map<String, dynamic> json) => SimpleTask(
      title: json['title'] as String,
      description: json['description'] as String,
      routine: $enumDecode(_$RoutineEnumMap, json['routine']),
      taskCredits: json['taskCredits'] as int,
      isDone: json['isDone'] as bool? ?? false,
    );

Map<String, dynamic> _$SimpleTaskToJson(SimpleTask instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'routine': _$RoutineEnumMap[instance.routine]!,
      'taskCredits': instance.taskCredits,
      'isDone': instance.isDone,
    };

const _$RoutineEnumMap = {
  Routine.oneshot: 'oneshot',
  Routine.daily: 'daily',
  Routine.weekly: 'weekly',
  Routine.monthly: 'monthly',
};
