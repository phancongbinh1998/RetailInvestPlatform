import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel {
  String username ;
  String password ;
  String fullName ;
  String email ;
  String phoneNumber ;


  LoginModel(
      this.username,
      this.password,
      this.fullName,
      this.email,
      this.phoneNumber
      );

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}
