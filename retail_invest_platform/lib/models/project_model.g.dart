// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectModel _$ProjectModelFromJson(Map<String, dynamic> json) {
  return ProjectModel(
    json['id'] as int,
    json['name'] as String,
    json['createdDate'] as String,
    json['termId'] as int,
    json['creator'] as String,
    json['raiseDuration'] as int,
    (json['curRaisedAmount'] as num)?.toDouble(),
    json['status'] as int,
    json['businessModel'] as String,
    json['locationAnalysis'] as String,
    json['hightlights'] as String,
    json['imageUrl'] as String,
    json['term'] == null
        ? null
        : InvestmentTerm.fromJson(json['term'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ProjectModelToJson(ProjectModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'createdDate': instance.createdDate,
      'termId': instance.termId,
      'creator': instance.creator,
      'raiseDuration': instance.raiseDuration,
      'curRaisedAmount': instance.curRaisedAmount,
      'status': instance.status,
      'businessModel': instance.businessModel,
      'locationAnalysis': instance.locationAnalysis,
      'hightlights': instance.hightlights,
      'imageUrl': instance.imageUrl,
      'term': instance.term,
    };
