import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'question.g.dart';

@JsonSerializable()
class Question extends Equatable {
  final String text;
  final int value;
  final int max;
  final int? divisions;

  const Question(
      {required this.text,
      required this.max,
      this.divisions = 1,
      this.value = 0});

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

  @override
  List<Object?> get props => [text, value, max, divisions];
}
