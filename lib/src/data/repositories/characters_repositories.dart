import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/src/data/model/header.dart';
import 'package:rick_and_morty_app/src/domain/repositories/characters_repositories.dart';
import 'package:rick_and_morty_app/src/shared/http/custom_dio.dart';

class CharactersRepositories implements ICharactersRepositories {
  final CustomDio _customDio;
  CharactersRepositories(this._customDio);

  @override
  Future<HeaderModel?> getCharacters() async {
    try {
      var response = await _customDio.instance.get(_customDio.getCharacter().toString());
      var res = await response.data;
      return HeaderModel.fromJson(res);
    } catch (err) {
      debugPrint((err as Exception).toString());
    }
    return null;
  }
}
