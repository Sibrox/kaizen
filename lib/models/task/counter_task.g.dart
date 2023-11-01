// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CounterTask _$CounterTaskFromJson(Map<String, dynamic> json) => CounterTask(
      title: json['title'] as String,
      description: json['description'] as String,
      routine: $enumDecode(_$RoutineEnumMap, json['routine']),
      taskCredits: json['taskCredits'] as int,
      maxValue: json['maxValue'] as int,
      currentValue: json['currentValue'] as int? ?? 0,
      isDone: json['isDone'] ?? false,
    );

Map<String, dynamic> _$CounterTaskToJson(CounterTask instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'routine': _$RoutineEnumMap[instance.routine]!,
      'taskCredits': instance.taskCredits,
      'isDone': instance.isDone,
      'maxValue': instance.maxValue,
      'currentValue': instance.currentValue,
    };

const _$RoutineEnumMap = {
  Routine.oneshot: 'oneshot',
  Routine.daily: 'daily',
  Routine.weekly: 'weekly',
  Routine.monthly: 'monthly',
};
