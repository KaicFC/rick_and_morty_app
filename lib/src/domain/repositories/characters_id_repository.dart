import 'package:rick_and_morty_app/src/data/model/characters_model.dart';

abstract class ICharactersIdRepositories {
  Future<CharactersModel?> getCharacterById(int characterId);
}
