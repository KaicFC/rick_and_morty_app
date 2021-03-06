import 'package:rick_and_morty_app/src/data/repositories/character_id_repository.dart';
import 'package:rick_and_morty_app/src/data/repositories/characters_repositories.dart';
import 'package:rick_and_morty_app/src/domain/repositories/characters_id_repository.dart';
import 'package:rick_and_morty_app/src/domain/repositories/characters_repositories.dart';
import 'package:rick_and_morty_app/src/shared/di/di.dart';
import 'package:rick_and_morty_app/src/shared/http/custom_dio.dart';

Future<void> domainModules() async {
  inject.registerLazySingleton<ICharactersRepositories>(
      () => CharactersRepositories(inject.get()));
  inject.registerLazySingleton<ICharactersIdRepositories>(
      () => CharacterIdRepository(inject.get()));

  inject.registerFactory<CustomDio>(
      () => CustomDio.getInstance());
}
