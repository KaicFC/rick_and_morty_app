import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/src/data/model/characters_model.dart';
import 'package:rick_and_morty_app/src/domain/repositories/characters_id_repository.dart';
import 'package:rick_and_morty_app/src/shared/http/custom_dio.dart';

class CharacterIdRepository implements ICharactersIdRepositories {
  final CustomDio _customDio;
  CharacterIdRepository(this._customDio);

  @override
  Future<CharactersModel?> getCharacterById(int characterId) async {
    try {
      var response = await _customDio.instance
          .get(_customDio.getCharacterId(characterId).toString());
      var res = await response.data;
      return CharactersModel.fromJson(res);
    } catch (err) {
      debugPrint((err as Exception).toString());
      return null;
    }
  }
}
