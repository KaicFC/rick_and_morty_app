import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/src/app.dart';
import 'package:rick_and_morty_app/src/shared/di/di.dart';

void main() async {
  //DI
  await setupInjection();

  runApp(const MyApp());
}
