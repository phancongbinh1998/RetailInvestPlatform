// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invest_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$InvestApiService extends InvestApiService {
  _$InvestApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = InvestApiService;

  @override
  Future<Response<dynamic>> postInvestTransaction(
      int project_id, String investor, double investAmount) {
    final $url = '/transactions/invest';
    final $params = <String, dynamic>{
      'project_id': project_id,
      'investor': investor,
      'investAmount': investAmount
    };
    final $request = Request('POST', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }
}
