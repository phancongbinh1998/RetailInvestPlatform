import 'dart:async';
import 'dart:convert';
import 'package:chopper/chopper.dart';
import 'package:retailinvestplatform/models/project_model.dart';

part "project_api_service.chopper.dart";

@ChopperApi(baseUrl: '/projects')
abstract class ProjectApiService extends ChopperService{

  static ProjectApiService create(){
    final client = ChopperClient(
        baseUrl: 'http://116.88.198.192:3389/api',
        services: [_$ProjectApiService()],
        converter: JsonToTypeConverter({
          ProjectModel: (jsonData) => ProjectModel.fromJson(jsonData)
        })
    );
    return _$ProjectApiService(client);
  }
  @Get()
  Future<Response> getAllProject();
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