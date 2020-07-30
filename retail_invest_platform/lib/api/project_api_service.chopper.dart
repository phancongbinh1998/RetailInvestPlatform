// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$ProjectApiService extends ProjectApiService {
  _$ProjectApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = ProjectApiService;

  @override
  Future<Response<List<ProjectModel>>> getAllProject() {
    final $url = '/projects/';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<List<ProjectModel>, ProjectModel>($request);
  }

  @override
  Future<Response<ProjectModel>> getDetailProject(int project_id) {
    final $url = '/projects/$project_id';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<ProjectModel, ProjectModel>($request);
  }

  @override
  Future<Response<List<ProfitReturn>>> getInvestorAmount(int project_id) {
    final $url = '/projects/$project_id/investors';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<List<ProfitReturn>, ProfitReturn>($request);
  }
}
