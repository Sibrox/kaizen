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

  factory Question.fromQuestion(Question question, int value) {
    return Question(
        text: question.text,
        max: question.max,
        divisions: question.divisions,
        value: value);
  }

  Question copyWith({text, max, divisions, value}) {
    return Question(
        text: text ?? this.text,
        max: max ?? this.max,
        divisions: divisions ?? this.divisions,
        value: value ?? this.value);
  }

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

  @override
  List<Object?> get props => [text, value, max, divisions];
}
