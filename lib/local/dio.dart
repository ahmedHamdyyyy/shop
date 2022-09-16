


import 'package:dio/dio.dart';

class Diohlper{
  static Dio? dio;
  static init()
  {
    dio= Dio(
        BaseOptions(
          baseUrl:"https://newsapi.org/",
          receiveDataWhenStatusError: true,
        )
    );
  }
  static Future<Response> getData({
    required String url,
    required Map<String, dynamic> quiry,
  })async
  {
    return await dio!.get(
      url,
      queryParameters:quiry,
    );
  }
}