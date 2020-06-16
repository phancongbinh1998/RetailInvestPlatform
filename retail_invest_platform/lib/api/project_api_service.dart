import 'dart:async';
import 'dart:convert';
import 'package:chopper/chopper.dart';
import 'package:retailinvestplatform/models/project_model.dart';

part "project_api_service.chopper.dart";

@ChopperApi(baseUrl: '/project/')
abstract class ProjectApiService extends ChopperService{

  static ProjectApiService create(){
    final client = ChopperClient(
        baseUrl: 'http://scout-robot.tech/api',
        services: [_$ProjectApiService()],
        converter: JsonToTypeConverter({
          ProjectModel: (jsonData) => ProjectModel.fromJson(jsonData)
        })
    );
    return _$ProjectApiService(client);
  }
  @Get(path: "getAll")
  Future<Response<List<ProjectModel>>> getResource();
}

class JsonToTypeConverter extends JsonConverter {

  final Map<Type, Function> typeToJsonFactoryMap;

  JsonToTypeConverter(this.typeToJsonFactoryMap);

  @override
  Response<BodyType> convertResponse<BodyType, InnerType>(Response response) {
    return response.replace(
      body: fromJsonData<BodyType, InnerType>(response.body, typeToJsonFactoryMap[InnerType]),
    );
  }

  T fromJsonData<T, InnerType>(String jsonData, Function jsonParser) {
    var jsonMap = json.decode(jsonData);

    if (jsonMap is List) {
      return jsonMap.map((item) => jsonParser(item as Map<String, dynamic>) as InnerType).toList() as T;
    }

    return jsonParser(jsonMap);
  }
}