import 'dart:async';
import 'dart:convert';
import 'package:chopper/chopper.dart';


part "invest_api_service.chopper.dart";

@ChopperApi(baseUrl: '/transactions/')
abstract class InvestApiService extends ChopperService{

  static InvestApiService create(){
    final client = ChopperClient(
      baseUrl: 'http://18.139.198.138/api',
      services: [_$InvestApiService()],

    );
    return _$InvestApiService(client);
  }
  @Post(path: "invest")
  Future<Response> postInvestTransaction(@Query() int project_id, @Query() String investor, @Query() double investAmount);

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