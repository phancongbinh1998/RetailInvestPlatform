// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) {
  return LoginModel(
    json['Username'] as String,
    json['Password'] as String,
    json['FullName'] as String,
    json['Email'] as String,
    json['PhoneNumber'] as String,
  );
}

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) =>
    <String, dynamic>{
      'Username': instance.Username,
      'Password': instance.Password,
      'FullName': instance.FullName,
      'Email': instance.Email,
      'PhoneNumber': instance.PhoneNumber,
    };
