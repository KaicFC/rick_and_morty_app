import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/src/presentation/modules/home/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rick and Morty App',
      theme: ThemeData.light(),
      home: const HomePage(),
    );
  }
}
