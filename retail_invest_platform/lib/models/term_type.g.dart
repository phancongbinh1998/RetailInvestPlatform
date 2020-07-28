// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'term_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TermType _$TermTypeFromJson(Map<String, dynamic> json) {
  return TermType(
    json['id'] as int,
    json['name'] as String,
    json['desc'] as String,
  );
}

Map<String, dynamic> _$TermTypeToJson(TermType instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'desc': instance.desc,
    };
