// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Question _$QuestionFromJson(Map<String, dynamic> json) => Question(
      text: json['text'] as String,
      max: (json['max'] as num).toDouble(),
      divisions: json['divisions'] as int? ?? 1,
      value: (json['value'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'text': instance.text,
      'value': instance.value,
      'max': instance.max,
      'divisions': instance.divisions,
    };
