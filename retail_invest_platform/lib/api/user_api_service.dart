import 'dart:async';
import 'dart:convert';
import 'package:chopper/chopper.dart';
import 'package:retailinvestplatform/models/login_model.dart';

part "user_api_service.chopper.dart";
@ChopperApi(baseUrl: '/user/')
abstract class UserApiService extends ChopperService{

  static UserApiService create(){
    final client = ChopperClient(
      baseUrl: 'http://scout-robot.tech/api',
      services: [_$UserApiService()],
      converter: JsonToTypeConverter({
        LoginModel: (jsonData) => LoginModel.fromJson(jsonData)
      })
    );
    return _$UserApiService(client);
  }
  @Get(path: "getInfo/?username={id}")
  Future<Response<LoginModel>> getResource(@Path() String id);

  @Get(path: "login/?loginUser.userName={username}&loginUser.password={password}")
  Future<Response<String>> checkLogin(@Path() String username, String password);
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