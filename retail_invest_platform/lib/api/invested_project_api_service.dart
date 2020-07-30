import 'dart:async';
import 'dart:convert';
import 'package:chopper/chopper.dart';
import 'package:retailinvestplatform/models/project_model.dart';


part "invested_project_api_service.chopper.dart";

@ChopperApi(baseUrl: '/investors/')
abstract class InvestedProjectApiService extends ChopperService{

  static InvestedProjectApiService create(){
    final client = ChopperClient(
      baseUrl: 'http://18.139.198.138/api',
      services: [_$InvestedProjectApiService()],
      converter: JsonToTypeConverter({
        ProjectModel: (jsonData) => ProjectModel.fromJson(jsonData)
      })
    );
    return _$InvestedProjectApiService(client);
  }
  @Get(path: "{investor_id}/invested-projects")
  Future<Response<List<ProjectModel>>> getAllProjectInvested(@Path() String investor_id);
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