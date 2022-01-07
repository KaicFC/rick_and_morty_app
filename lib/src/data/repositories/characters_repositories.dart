import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/src/data/model/header.dart';
import 'package:rick_and_morty_app/src/shared/http/custom_dio.dart';

class CharactersRepositories {
  Future<HeaderModel?> getCharacters() async {
    try {
      var uri = Uri.parse("${CustomDio.getInstance().dio.options.baseUrl}"
          "${CustomDio.endpointCharacters}");
      var response = await CustomDio.getInstance().dio.get(uri.toString());
      var res = await response.data;
      return HeaderModel.fromJson(res);
    } catch (err) {
      debugPrint((err as Exception).toString());
    }
  }
}
