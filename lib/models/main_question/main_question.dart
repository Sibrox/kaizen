import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'main_question.g.dart';

@JsonSerializable()
class MainQuestion{

  final String? text;
  bool? value;

  MainQuestion({this.text, this.value});

  factory MainQuestion.fromJson(Map<String,dynamic> json) => _$MainQuestionFromJson(json);

  Map<String,dynamic> toJson() => _$MainQuestionToJson(this);

  MainQuestion createToggle(){

    return MainQuestion(text: text,value: !value!);
  }
}