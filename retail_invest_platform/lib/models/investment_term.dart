import 'package:retailinvestplatform/models/term_type.dart';

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
}