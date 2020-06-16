import 'dart:async';
import 'dart:convert';
import 'package:chopper/chopper.dart';
import 'package:retailinvestplatform/models/term_types_model.dart';

part "term_types_api_service.chopper.dart";

@ChopperApi(baseUrl: '/term/')
abstract class TermTypesApiService extends ChopperService{

  static TermTypesApiService create(){
    final client = ChopperClient(
        baseUrl: 'http://scout-robot.tech/api',
        services: [_$TermTypesApiService()],
        converter: JsonToTypeConverter({
          TermTypesModel: (jsonData) => TermTypesModel.fromJson(jsonData)
        })
    );
    return _$TermTypesApiService(client);
  }
  @Get(path: "getTypeById/?id={id}")
  Future<Response<TermTypesModel>> getResource(@Path() String id);
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