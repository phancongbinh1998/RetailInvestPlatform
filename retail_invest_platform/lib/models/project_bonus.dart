import 'package:json_annotation/json_annotation.dart';
part 'project_bonus.g.dart';

@JsonSerializable()
class ProjectBonus{
  int projectId;
  int id;
  String title;
  String bonusDesc;
  int avaiableQty;

  ProjectBonus(
      this.projectId, this.id, this.title, this.bonusDesc, this.avaiableQty);

  factory ProjectBonus.fromJson(Map<String, dynamic> json) =>
      _$ProjectBonusFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectBonusToJson(this);
}