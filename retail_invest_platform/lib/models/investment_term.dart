import 'package:retailinvestplatform/models/term_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'investment_term.g.dart';

@JsonSerializable()
class InvestmentTerm{
  int id;
  int termTypeId;
  int maturity;
  double minRaiseGoal;
  double maxRaiseGoal;
  double minIndividualInvest;
  double anualInvestRate;
  int paymentPeriod;
  TermType termType;

  InvestmentTerm(
      this.id,
      this.termTypeId,
      this.maturity,
      this.minRaiseGoal,
      this.maxRaiseGoal,
      this.minIndividualInvest,
      this.anualInvestRate,
      this.paymentPeriod,
      this.termType);

  factory InvestmentTerm.fromJson(Map<String, dynamic> json) =>
      _$InvestmentTermFromJson(json);

  Map<String, dynamic> toJson() => _$InvestmentTermToJson(this);
}

