// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'investment_term.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvestmentTerm _$InvestmentTermFromJson(Map<String, dynamic> json) {
  return InvestmentTerm(
    json['id'] as int,
    json['termTypeId'] as int,
    json['maturity'] as int,
    (json['minRaiseGoal'] as num)?.toDouble(),
    (json['maxRaiseGoal'] as num)?.toDouble(),
    (json['minIndividualInvest'] as num)?.toDouble(),
    (json['anualInvestRate'] as num)?.toDouble(),
    json['paymentPeriod'] as int,
    json['termType'] == null
        ? null
        : TermType.fromJson(json['termType'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$InvestmentTermToJson(InvestmentTerm instance) =>
    <String, dynamic>{
      'id': instance.id,
      'termTypeId': instance.termTypeId,
      'maturity': instance.maturity,
      'minRaiseGoal': instance.minRaiseGoal,
      'maxRaiseGoal': instance.maxRaiseGoal,
      'minIndividualInvest': instance.minIndividualInvest,
      'anualInvestRate': instance.anualInvestRate,
      'paymentPeriod': instance.paymentPeriod,
      'termType': instance.termType,
    };
