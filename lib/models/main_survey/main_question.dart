import 'package:json_annotation/json_annotation.dart';

part 'main_question.g.dart';

@JsonSerializable()
class MainQuestion {
  final String? text;
  bool? value;

  MainQuestion({this.text, this.value});

  factory MainQuestion.fromJson(Map<String, dynamic> json) =>
      _$MainQuestionFromJson(json);

  Map<String, dynamic> toJson() => _$MainQuestionToJson(this);

  MainQuestion createToggle() {
    return MainQuestion(text: text, value: !value!);
  }

  @override
  bool operator ==(Object other) {
    return other is MainQuestion && text == other.text && value == other.value;
  }

  @override
  int get hashCode => text.hashCode;
}
