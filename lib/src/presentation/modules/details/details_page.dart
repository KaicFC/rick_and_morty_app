// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rick_and_morty_app/src/presentation/modules/details/details_controller.dart';

class DetailsPage extends StatefulWidget {
  final int? characterId;

  const DetailsPage({Key? key, required this.characterId}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final DetailsController _detailsController = DetailsController();

  @override
  void initState() {
    _detailsController.getCharacterById(widget.characterId!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return _detailsController.charactersModel == null
          ? Center(child: CircularProgressIndicator())
          : SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      _image(),
                      SizedBox(height: 20),
                      _description(),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            );
    });
  }

  _image() {
    return Container(
      width: double.infinity,
      height: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        image: DecorationImage(
            image: NetworkImage('${_detailsController.charactersModel!.image}'),
            fit: BoxFit.cover),
      ),
    );
  }

  _description() {
    var controller = _detailsController.charactersModel!;
    return Column(
      children: [
        Text(
          '${controller.name}',
          style: TextStyle(
              decoration: TextDecoration.none,
              fontSize: 30,
              color: Colors.white),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                _textCard('Status: ', true),
                _textCard('${controller.status}', false),
              ],
            ),
            Row(
              children: [
                _textCard('Espécie: ', true),
                _textCard('${controller.species}', false),
              ],
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                _textCard('gender: ', true),
                _textCard('${controller.gender}', false),
              ],
            ),
            Row(
              children: [
                _textCard('type: ', true),
                _textCard('${controller.type}', false),
              ],
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: [
            _textCard('Origin: ', true),
            _textCard('${controller.origin!.name}', false)
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: [
            _textCard('Location: ', true),
            _textCard('${controller.location!.name}', false),
          ],
        ),
      ],
    );
  }

  _textCard(String name, bool isDescription) {
    return Row(
      children: [
        isDescription == true
            ? Text(
                name.toUpperCase(),
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 20,
                    color: Colors.greenAccent),
              )
            : Text(
                name,
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 20,
                    color: Colors.white),
              ),
      ],
    );
  }
}
