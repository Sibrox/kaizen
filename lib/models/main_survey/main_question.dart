import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'main_question.g.dart';

@JsonSerializable()
class MainQuestion extends Equatable {
  final String text;
  final bool value;

  const MainQuestion({required this.text, required this.value});

  factory MainQuestion.fromJson(Map<String, dynamic> json) =>
      _$MainQuestionFromJson(json);

  Map<String, dynamic> toJson() => _$MainQuestionToJson(this);

  MainQuestion toggle() {
    return MainQuestion(text: text, value: !value);
  }

  @override
  List<Object?> get props => [text, value];
}
