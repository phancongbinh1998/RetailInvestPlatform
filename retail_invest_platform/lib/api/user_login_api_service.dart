import 'dart:async';
import 'dart:convert';
import 'package:chopper/chopper.dart';


part "user_login_api_service.chopper.dart";
@ChopperApi(baseUrl: '/auth/')
abstract class UserLoginApiService extends ChopperService{

  static UserLoginApiService create(){
    final client = ChopperClient(
        baseUrl: 'http://18.139.198.138/api',
        services: [_$UserLoginApiService()],

    );
    return _$UserLoginApiService(client);
  }


  @Get(path: "{username}")
  Future<Response> checkLogin(@Path() String username,@Query() String password);
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