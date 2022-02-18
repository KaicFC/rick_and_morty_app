// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rick_and_morty_app/src/presentation/modules/details/details_controller.dart';
import 'package:rick_and_morty_app/src/presentation/widgets/loading.dart';
import 'package:rick_and_morty_app/src/shared/di/di.dart';

class DetailsPage extends StatefulWidget {
  final int? characterId;

  const DetailsPage({Key? key, required this.characterId}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final _detailsController = inject.get<DetailsController>();

  @override
  void initState() {
    _detailsController.getCharacterById(widget.characterId!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return _detailsController.charactersModel == null
            ? LoadingCustom()
            : SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        _appBar(),
                        _image(),
                        _description(),
                        _episodes(),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }

  _appBar() {
    return TweenAnimationBuilder<double?>(
      tween: Tween(begin: 1, end: 0),
      duration: const Duration(seconds: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 30,
            ),
          ),
          Expanded(
            child: Text(
              '${_detailsController.charactersModel!.name}',
              textAlign: TextAlign.center,
              style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
          Visibility(visible: false, child: Container())
        ],
      ),
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0.0, -100 * value!),
          child: child!,
        );
      },
    );
  }

  _image() {
    return TweenAnimationBuilder<double?>(
      tween: Tween(begin: 0, end: 1),
      duration: const Duration(seconds: 3),
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Container(
          width: double.infinity,
          height: 400,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            image: DecorationImage(
              image:
                  NetworkImage('${_detailsController.charactersModel!.image}'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      builder: (context, value, child) {
        return Opacity(opacity: value!, child: child!);
      },
    );
  }

  _description() {
    var controller = _detailsController.charactersModel!;
    return TweenAnimationBuilder<double?>(
      duration: const Duration(seconds: 2),
      tween: Tween(begin: 1, end: 0),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            Text(
              'Sobre'.toUpperCase(),
              style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 23,
                color: Colors.lightGreenAccent,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                _textCard('Status: ', true),
                _textCard('${controller.status}', false),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                _textCard('Espécie: ', true),
                _textCard('${controller.species}', false),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                _textCard('Genero: ', true),
                _textCard('${controller.gender}', false),
              ],
            ),
            SizedBox(height: 10),
            Wrap(
              children: [
                _textCard('Origem: ', true),
                _textCard('${controller.origin!.name}', false)
              ],
            ),
            SizedBox(height: 10),
            Wrap(
              children: [
                _textCard('Localizacao: ', true),
                _textCard('${controller.location!.name}', false),
              ],
            ),
          ],
        ),
      ),
      builder: (context, value, child) {
        return Transform.translate(
            offset: Offset(0, 100 * value!), child: child!);
      },
    );
  }

  _episodes() {
    var controller = _detailsController.charactersModel!.episode!;
    return TweenAnimationBuilder<double?>(
      tween: Tween(begin: 1, end: 0),
      duration: Duration(seconds: 3),
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 8, right: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                'Episódios'.toUpperCase(),
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 20,
                  color: Colors.lightGreenAccent,
                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 280,
              child: Expanded(
                child: GridView.builder(
                  addAutomaticKeepAlives: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  scrollDirection: Axis.vertical,
                  itemCount: controller.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.yellow,
                            width: 2,
                          ),
                          color: Colors.black,
                        ),
                        child: Center(
                          child: Text(
                            '${index + 1}',
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 18,
                              color: Colors.greenAccent,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, 200 * value!),
          child: child!,
        );
      },
    );
  }

  _textCard(String name, bool isDescription) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isDescription == true
            ? Text(
                name.toUpperCase(),
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 20,
                  color: Colors.greenAccent,
                ),
              )
            : Text(
                name,
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
      ],
    );
  }
}
