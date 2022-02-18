// ignore_for_file: unnecessary_this

import 'package:dio/dio.dart';
import 'package:flutter/rendering.dart';

class CustomDio {
  late Dio _dio;
  Dio get instance => _dio;

  CustomDio.getInstance() {
    _dio = Dio(_getOptions());
    _dio.interceptors.add(interpceptorResponse());
    _dio.interceptors.add(interpceptorRequest());
    _dio.interceptors.add(interpceptorOnError());
  }

  BaseOptions _getOptions() => BaseOptions(
        baseUrl: "https://rickandmortyapi.com/api/",
        connectTimeout: 10000,
        receiveTimeout: 10000,
      );

  getCharacter() {
    var uri = Uri.parse("${_getOptions().baseUrl}/character/");
    return uri;
  }

  getCharacterId(int id) {
    var uri = Uri.parse("${_getOptions().baseUrl}/character/$id");
    return uri;
  }

  getLocation() {
    var uri = Uri.parse("${_getOptions().baseUrl}/location/");
    return uri;
  }

  getEpisode() {
    var uri = Uri.parse("${_getOptions().baseUrl}/episode/");
    return uri;
  }
}

InterceptorsWrapper interpceptorRequest() {
  return InterceptorsWrapper(onRequest: (requestOptions, handler) {
    debugPrint("===== ON REQUEST =======");
    debugPrint(requestOptions.path);
    debugPrint(requestOptions.method);
    handler.next(requestOptions);
  });
}

InterceptorsWrapper interpceptorResponse() {
  return InterceptorsWrapper(onResponse: (responseOptins, handler) {
    debugPrint("======= ON RESPONSE =====");
    debugPrint(responseOptins.requestOptions.path);
    debugPrint(responseOptins.requestOptions.method);
    debugPrint(responseOptins.data.toString());
    handler.next(responseOptins);
  });
}

InterceptorsWrapper interpceptorOnError() {
  return InterceptorsWrapper(onError: (dioerror, handler) {
    debugPrint("===== ERROR ======");
    debugPrint(dioerror.message);
  });
}
