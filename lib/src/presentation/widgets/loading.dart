import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingCustom extends StatefulWidget {
  const LoadingCustom({Key? key}) : super(key: key);

  @override
  _LoadingCustomState createState() => _LoadingCustomState();
}

class _LoadingCustomState extends State<LoadingCustom> {
  final String url =
      'https://assets6.lottiefiles.com/packages/lf20_24qa5c4r.json';

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Lottie.network(url, repeat: true, fit: BoxFit.cover),
      ),
    );
  }
}
