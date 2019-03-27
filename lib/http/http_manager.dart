import 'package:dio/dio.dart';
import 'package:flutter_gank/http/gank_api_service.dart';

class HttpManager {
  static Dio dio;
  static HttpManager _instance;

  // 工厂模式
  factory HttpManager() => getInstance();

  static HttpManager get instance => getInstance();

  HttpManager._internal() {
    if (dio == null) {
      BaseOptions baseOptions = new BaseOptions(
        baseUrl: GankApiService.API_GANK_HOST,
        connectTimeout: 10000,
        receiveTimeout: 10000,
      );

      dio = new Dio(baseOptions);
    }
  }

  static HttpManager getInstance() {
    if (_instance == null) {
      _instance = new HttpManager._internal();
    }
    return _instance;
  }

   Future<Map> getRequest(String url) async {
    try {
      Response response =
          await dio.request(url, options: new Options(method: "GET"));
      return response.data;
    } on DioError catch (e) {
    }

    return new Map();
  }
}
