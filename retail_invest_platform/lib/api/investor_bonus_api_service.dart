import 'dart:async';
import 'dart:convert';
import 'package:chopper/chopper.dart';
import 'package:retailinvestplatform/models/profit_return.dart';
import 'package:retailinvestplatform/models/project_bonus.dart';
import 'package:retailinvestplatform/models/project_model.dart';


part "investor_bonus_api_service.chopper.dart";

@ChopperApi(baseUrl: '/investors/')
abstract class InvestorBonusProjectApiService extends ChopperService{

  static InvestorBonusProjectApiService create(){
    final client = ChopperClient(
        baseUrl: 'http://18.139.198.138/api',
        services: [_$InvestorBonusProjectApiService()],
        converter: JsonToTypeConverter({
          ProjectBonus: (jsonData) => ProjectBonus.fromJson(jsonData),
          ProfitReturn: (jsonData) => ProfitReturn.fromJson(jsonData)
        })
    );
    return _$InvestorBonusProjectApiService(client);
  }

  @Get(path: "{investor_id}/{project_id}/bonuses")
  Future<Response<List<ProjectBonus>>> getProjectBonus(@Path() String investor_id, @Path() int project_id);
  @Get(path: "{investor_id}/{project_id}/profit-return")
  Future<Response<List<ProfitReturn>>> getProfitReturn(@Path() String investor_id, @Path() int project_id);

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