import 'package:chennai/model/model_class.dart';
import 'package:chennai/model/service/core.dart';
import 'package:dio/dio.dart';

final dio = Dio(BaseOptions(
  responseType: ResponseType.plain,
  baseUrl: kurl,
));

//api integration
class HomeServices {
  //function for getting details
  static Future<ModelClass?> getDatas() async {
    Response response = await dio.get('entries');

    ModelClass responseData = modelClassFromJson(response.data);

    return responseData;
  }
}
