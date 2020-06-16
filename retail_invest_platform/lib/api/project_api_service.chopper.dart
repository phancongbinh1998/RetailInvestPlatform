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
  Future<Response<List<ProjectModel>>> getResource() {
    final $url = '/project/getAll';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<List<ProjectModel>, ProjectModel>($request);
  }
}
