// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_login_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$UserLoginApiService extends UserLoginApiService {
  _$UserLoginApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = UserLoginApiService;

  @override
  Future<Response<dynamic>> checkLogin(String username, String password) {
    final $url = '/auth/$username';
    final $params = <String, dynamic>{'password': password};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }
}
