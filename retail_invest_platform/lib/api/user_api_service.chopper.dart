// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$UserApiService extends UserApiService {
  _$UserApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = UserApiService;

  @override
  Future<Response<LoginModel>> getResource(String username) {
    final $url = '/users/$username';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<LoginModel, LoginModel>($request);
  }
}
