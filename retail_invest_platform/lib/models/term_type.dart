import 'package:json_annotation/json_annotation.dart';

part 'term_type.g.dart';

@JsonSerializable()
class TermType{
  int id;
  String name;
  String desc;

  TermType(this.id, this.name, this.desc);

  factory TermType.fromJson(Map<String, dynamic> json) =>
      _$TermTypeFromJson(json);

  Map<String, dynamic> toJson() => _$TermTypeToJson(this);
}