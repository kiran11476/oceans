import 'dart:developer';

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
    log(response.toString());
    ModelClass responseData = modelClassFromJson(response.data);
    log('loggg');
    return responseData;
  }
}
