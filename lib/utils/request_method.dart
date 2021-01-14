import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import 'package:huoshan_app/config/index.dart';

enum Method { get, post }

Map<String,dynamic> optHeader = {
  'accept-language':'zh-cn',
  'content-type':'application/json'
};

Future sendRequest(String url, Method method, Map<String, dynamic> map) async {
  try {
    print("开始请求数据");
    Response response;
    Dio _dio;
    _dio = new Dio(
      new BaseOptions(baseUrl: Config.getApiurl(), connectTimeout: 15000, headers: optHeader)
    );
    var type = method;
    switch (type) {
      case Method.get:
        print('开始使用get');
        response = await _dio.get(url, queryParameters: map);
        break;
      case Method.post:
        print('开始使用post');
        response = await _dio.post(url, data: map);
        break;
    }
    // if (!empty(response.data)) {
    //   print('收到返回信息==>' + response.data);
    // }
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口出现异常');
    }
  } catch (e) {
    return print('error');
  }
}

// var dio = new Dio(BaseOptions(baseUrl: Home.BASE_URL, connectTimeout: 30000,headers: optHeader));

// class Request {

//   // static Future get(String url, [Map<String, dynamic> params]) async {
//   static Future get(String url, [Map<String, dynamic> params]) async {
//     var response;
//     if (params != null) {
//       response = await dio.get(url, queryParameters: params);
//       // response = await dio.get(url);
//     } else {
//       response = await dio.get(url);
//     }
//     return response.data;
//   }

//   static Future post(String url, Map<String, dynamic> params) async {
//     var response = await dio.post(url, data: params);
//     return response.data;
//   }
// }