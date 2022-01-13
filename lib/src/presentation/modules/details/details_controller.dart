import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:rick_and_morty_app/src/data/model/characters_model.dart';
import 'package:rick_and_morty_app/src/data/model/header.dart';
import 'package:rick_and_morty_app/src/data/repositories/character_id_repository.dart';
part 'details_controller.g.dart';

class DetailsController = _DetailsControllerBase with _$DetailsController;

abstract class _DetailsControllerBase with Store {
  CharacterIdRepository detailsRepository = CharacterIdRepository();

  @observable
  HeaderModel? headerModel;

  @observable
  CharactersModel? charactersModel;

  @action
  getCharacterById(int characterId) async {
    try {
      charactersModel = await detailsRepository.getCharacterById(characterId);
      return charactersModel;
    } catch (err) {
      debugPrint((err as Exception).toString());
    }
  }
}
