// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_bonus.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectBonus _$ProjectBonusFromJson(Map<String, dynamic> json) {
  return ProjectBonus(
    json['projectId'] as int,
    json['id'] as int,
    json['title'] as String,
    json['bonusDesc'] as String,
    json['avaiableQty'] as int,
  );
}

Map<String, dynamic> _$ProjectBonusToJson(ProjectBonus instance) =>
    <String, dynamic>{
      'projectId': instance.projectId,
      'id': instance.id,
      'title': instance.title,
      'bonusDesc': instance.bonusDesc,
      'avaiableQty': instance.avaiableQty,
    };
