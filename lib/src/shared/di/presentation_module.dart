import 'package:rick_and_morty_app/src/presentation/modules/details/details_controller.dart';
import 'package:rick_and_morty_app/src/presentation/modules/home/home_controller.dart';
import 'package:rick_and_morty_app/src/shared/di/di.dart';

Future<void> presentationModules() async {
  inject.registerFactory<HomeController>(() => HomeController(inject.get()));
  inject.registerFactory<DetailsController>(
      () => DetailsController(inject.get()));
}
