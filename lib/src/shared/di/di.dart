import 'package:get_it/get_it.dart';
import 'package:rick_and_morty_app/src/shared/di/domain_modules.dart';
import 'package:rick_and_morty_app/src/shared/di/presentation_module.dart';

GetIt inject = GetIt.instance;

Future<void> setupInjection() async {
  await domainModules();
  await presentationModules();
}
