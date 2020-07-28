import 'dart:async';
import 'dart:convert';
import 'package:chopper/chopper.dart';
import 'package:retailinvestplatform/models/term_type.dart';

part "term_types_api_service.chopper.dart";

@ChopperApi(baseUrl: '/termtypes/')
abstract class TermTypesApiService extends ChopperService{

  static TermTypesApiService create(){
    final client = ChopperClient(
        baseUrl: 'http://18.139.198.138/api',
        services: [_$TermTypesApiService()],
        converter: JsonToTypeConverter({
          TermType: (jsonData) => TermType.fromJson(jsonData)
        })
    );
    return _$TermTypesApiService(client);
  }
  @Get()
  Future<Response<List<TermType>>> getAllTermTypes();

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