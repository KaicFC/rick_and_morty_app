import 'package:dio/dio.dart';
import 'package:flutter/rendering.dart';

class CustomDio {
  late Dio dio;

  CustomDio.getInstance() {
    this.dio = Dio();
    dio.options.baseUrl = "https://rickandmortyapi.com/api/";

    dio.interceptors.add(interpceptorResponse());
    dio.interceptors.add(interpceptorRequest());
    dio.interceptors.add(interpceptorOnError());
  }

  static const String endpointCharacters = 'character';
  static const String endpointLocations = 'location';
  static const String endpointEpisodes = 'episode';
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
