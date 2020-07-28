// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'term_types_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$TermTypesApiService extends TermTypesApiService {
  _$TermTypesApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = TermTypesApiService;

  @override
  Future<Response<List<TermType>>> getAllTermTypes() {
    final $url = '/termtypes/';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<List<TermType>, TermType>($request);
  }
}
