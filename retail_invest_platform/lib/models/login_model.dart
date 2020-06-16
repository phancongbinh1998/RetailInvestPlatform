import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel {
  String Username ;
  String Password ;
  String FullName ;
  String Email ;
  String PhoneNumber ;


  LoginModel(
      this.Username,
      this.Password,
      this.FullName,
      this.Email,
      this.PhoneNumber
      );

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}
