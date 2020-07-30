// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profit_return.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfitReturn _$ProfitReturnFromJson(Map<String, dynamic> json) {
  return ProfitReturn(
    json['actor'] as String,
    json['projectId'] as int,
    (json['amount'] as num)?.toDouble(),
    json['date'] as String,
    json['transactionNumber'] as String,
    json['status'] as int,
    json['description'] as String,
    json['type'] as int,
  );
}

Map<String, dynamic> _$ProfitReturnToJson(ProfitReturn instance) =>
    <String, dynamic>{
      'actor': instance.actor,
      'projectId': instance.projectId,
      'amount': instance.amount,
      'date': instance.date,
      'transactionNumber': instance.transactionNumber,
      'status': instance.status,
      'description': instance.description,
      'type': instance.type,
    };
