import 'package:json_annotation/json_annotation.dart';


part 'profit_return.g.dart';

@JsonSerializable()
class ProfitReturn{
  String actor;
  int projectId;
  double amount;
  String date;
  String transactionNumber;
  int status;
  String description;
  int type;


  ProfitReturn(
      this.actor,
      this.projectId,
      this.amount,
      this.date,
      this.transactionNumber,
      this.status,
      this.description,
      this.type,);
//      this.creatorNavigation,

//      this.projectBonus,
//      this.teamMember);

  factory ProfitReturn.fromJson(Map<String, dynamic> json) =>
      _$ProfitReturnFromJson(json);

  Map<String, dynamic> toJson() => _$ProfitReturnToJson(this);
}