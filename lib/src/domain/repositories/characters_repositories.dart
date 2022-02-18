import 'package:rick_and_morty_app/src/data/model/header.dart';

abstract class ICharactersRepositories {
  Future<HeaderModel?> getCharacters();
}
