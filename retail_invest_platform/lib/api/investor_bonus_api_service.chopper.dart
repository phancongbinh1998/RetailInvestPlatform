// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'investor_bonus_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$InvestorBonusProjectApiService extends InvestorBonusProjectApiService {
  _$InvestorBonusProjectApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = InvestorBonusProjectApiService;

  @override
  Future<Response<List<ProjectBonus>>> getProjectBonus(
      String investor_id, int project_id) {
    final $url = '/investors/$investor_id/$project_id/bonuses';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<List<ProjectBonus>, ProjectBonus>($request);
  }

  @override
  Future<Response<List<ProfitReturn>>> getProfitReturn(
      String investor_id, int project_id) {
    final $url = '/investors/$investor_id/$project_id/profit-return';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<List<ProfitReturn>, ProfitReturn>($request);
  }
}
