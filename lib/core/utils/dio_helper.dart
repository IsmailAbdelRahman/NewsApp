import 'package:dio/dio.dart';

//api   application programming interface

class DioHelper {
  static Dio? dio;
  static String url1 = 'https://newsapi.org/';
  static initi() {
    dio = Dio(BaseOptions(
        baseUrl: url1,
        receiveDataWhenStatusError: true /* , receiveTimeout: 500*/));
  }

  static Future<Response> get(
      {required String url,
      required Map<String, dynamic> queryParameter}) async {
    return await dio!.get(url, queryParameters: queryParameter);
  }
}

class ServicesDio {
  final Dio _dio;
  ServicesDio(this._dio);

  Future<Map<String, dynamic>> ger(
      {required String point,
      required Map<String, dynamic> queryParameter}) async {
    var respons = await _dio.get('https://newsapi.org/$point',
        queryParameters: queryParameter);

    return respons.data;
  }
}

class Diod {
  static Dio? dio;

  static dioin() {
    dio = Dio(BaseOptions(baseUrl: "https://newsapi.org/"));
  }

  static diofun() async {
    var response = await dio!.get(
        "v2/top-headlines?apiKey=6cd14d2183fc4b709f88fc81a9ecb9cc",
        queryParameters: {'category': 'sports', "country": "eg"});

    print(response);
  }
}
