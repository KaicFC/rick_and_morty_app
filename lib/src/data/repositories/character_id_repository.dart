import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/src/data/model/characters_model.dart';
import 'package:rick_and_morty_app/src/shared/http/custom_dio.dart';

class CharacterIdRepository{
    Future<CharactersModel?> getCharacterById(int characterId) async {
    try {
      var uri = Uri.parse("${CustomDio.getInstance().dio.options.baseUrl}"
          "${CustomDio.endpointCharacters}"
          "$characterId");
          
      var response = await CustomDio.getInstance().dio.get(uri.toString());
      var res = await response.data;
      return CharactersModel.fromJson(res);
    } catch (err) {
      debugPrint((err as Exception).toString());
    }
  }
}