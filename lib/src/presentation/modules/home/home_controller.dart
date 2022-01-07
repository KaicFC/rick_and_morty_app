import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:rick_and_morty_app/src/data/model/header.dart';
import 'package:rick_and_morty_app/src/data/repositories/characters_repositories.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final CharactersRepositories _homeRepositories = CharactersRepositories();

  @observable
  HeaderModel? headerModel;

  @action
  getCharacters() async {
    try {
      headerModel = await _homeRepositories.getCharacters();
    } catch (err) {
      debugPrint((err as Exception).toString());
    }
  }
}
