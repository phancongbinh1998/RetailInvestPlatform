// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invested_project_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$InvestedProjectApiService extends InvestedProjectApiService {
  _$InvestedProjectApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = InvestedProjectApiService;

  @override
  Future<Response<List<ProjectModel>>> getAllProjectInvested(
      String investor_id) {
    final $url = '/investors/$investor_id/invested-projects';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<List<ProjectModel>, ProjectModel>($request);
  }
}
