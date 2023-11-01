// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_manager.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskManager _$TaskManagerFromJson(Map<String, dynamic> json) => TaskManager(
      tasks: (json['tasks'] as List<dynamic>)
          .map((e) => SimpleTask.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TaskManagerToJson(TaskManager instance) =>
    <String, dynamic>{
      'tasks': instance.tasks,
    };
