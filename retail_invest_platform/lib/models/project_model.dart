import 'package:json_annotation/json_annotation.dart';
import 'package:retailinvestplatform/models/project_bonus.dart';
import 'package:retailinvestplatform/models/team_member.dart';
import 'package:retailinvestplatform/models/user_account.dart';

import 'investment_term.dart';

part 'project_model.g.dart';

@JsonSerializable()
class ProjectModel{
  int id;
  String name;
  String createdDate;
  int termId;
  String creator;
  int raiseDuration;
  double curRaisedAmount;
  int status;
  String businessModel;
  String locationAnalysis;
  String hightlights;
  String imageUrl;
//  UserAccount creatorNavigation;
//  InvestmentTerm term;
//  ProjectBonus projectBonus;
//  TeamMember teamMember;


  ProjectModel(
      this.id,
      this.name,
      this.createdDate,
      this.termId,
      this.creator,
      this.raiseDuration,
      this.curRaisedAmount,
      this.status,
      this.businessModel,
      this.locationAnalysis,
      this.hightlights,
      this.imageUrl,);
//      this.creatorNavigation,
//      this.term,
//      this.projectBonus,
//      this.teamMember);

  factory ProjectModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectModelToJson(this);
}