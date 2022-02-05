// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rick_and_morty_app/src/presentation/modules/details/details_page.dart';
import 'package:rick_and_morty_app/src/presentation/modules/home/home_controller.dart';
import 'package:rick_and_morty_app/src/presentation/widgets/loading.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _homeController = HomeController();

  @override
  void initState() {
    _homeController.getCharacters();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return _homeController.headerModel == null
          ? LoadingCustom()
          : SafeArea(
              child: Container(
                child: _homePage(),
              ),
            );
    });
  }

  _homePage() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          SizedBox(height: 20),
          _appBar(),
          SizedBox(height: 20),
          _listChar()
        ],
      ),
    );
  }

  _appBar() {
    return TweenAnimationBuilder<double?>(
        tween: Tween(begin: 1, end: 0),
        duration: const Duration(seconds: 2),
        child: Text(
          'Characters',
          style: TextStyle(
            decoration: TextDecoration.none,
            color: Colors.white,
            fontSize: 40,
          ),
        ),
        builder: (context, value, child) {
          return Transform.translate(
              offset: Offset(0.0, -100 * value!), child: child!);
        });
  }

  _listChar() {
    var controller = _homeController.headerModel!.results!;
    return Expanded(
        child: ListView.builder(
      itemCount: controller.length,
      itemBuilder: (context, index) {
        return _cardList(index);
      },
    ));
  }

  _cardList(int index) {
    var controller = _homeController.headerModel!.results!;
    return TweenAnimationBuilder<double?>(
        duration: const Duration(seconds: 2),
        tween: Tween(begin: 1, end: 0),
        curve: Curves.linear,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsPage(
                  characterId: controller[index]['id'],
                ),
              ),
            );
          },
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.brown,
              ),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: TweenAnimationBuilder<double?>(
                        duration: const Duration(seconds: 2),
                        curve: Curves.easeIn,
                        tween: Tween(begin: 1, end: 0),
                        child: Container(
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey,
                            image: DecorationImage(
                                image: NetworkImage(
                                    '${controller[index]['image']}'),
                                fit: BoxFit.cover),
                          ),
                        ),
                        builder: (context, value, child) {
                          return Opacity(
                            opacity: 1 - value!,
                            child: child!,
                          );
                        }),
                  ),
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: TweenAnimationBuilder<double?>(
                        duration: const Duration(seconds: 3),
                        curve: Curves.bounceInOut,
                        tween: Tween(begin: 1, end: 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${controller[index]['name']}',
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 22,
                                  color: Colors.white),
                            ),
                            SizedBox(height: 15),
                            _textCard(index, 'status', 'status'),
                            SizedBox(height: 5),
                            _textCard(index, 'espécies', 'species'),
                            SizedBox(height: 5),
                            _textCard(index, 'genero', 'gender'),
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'EPISÓDIOS',
                                  style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 15,
                                      color: Colors.greenAccent),
                                ),
                                Text(
                                  '${controller[index]['episode'].length}',
                                  style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 15,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                        builder: (context, value, child) {
                          return Transform.translate(
                              offset: Offset(200 * value!, 0), child: child!);
                        }),
                  )),
                ],
              ),
            ),
          ),
        ),
        builder: (context, value, child) {
          return Transform.translate(
            offset: Offset(0.0, 300 * value!),
            child: child!,
          );
        });
  }

  _textCard(int index, String name, String key) {
    var controller = _homeController.headerModel!.results!;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name.toUpperCase(),
          style: TextStyle(
              decoration: TextDecoration.none,
              fontSize: 15,
              color: Colors.greenAccent),
        ),
        Text(
          '${controller[index][key]}',
          style: TextStyle(
              decoration: TextDecoration.none,
              fontSize: 15,
              color: Colors.white),
        ),
      ],
    );
  }
}
