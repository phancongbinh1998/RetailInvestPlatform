import 'package:json_annotation/json_annotation.dart';

part 'term_types_model.g.dart';

@JsonSerializable()
class TermTypesModel{
  String Name;

  TermTypesModel(
      this.Name
      );

  factory TermTypesModel.fromJson(Map<String, dynamic> json) =>
      _$TermTypesModelFromJson(json);

  Map<String, dynamic> toJson() => _$TermTypesModelToJson(this);
}