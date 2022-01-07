// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$headerModelAtom = Atom(name: '_HomeControllerBase.headerModel');

  @override
  HeaderModel? get headerModel {
    _$headerModelAtom.reportRead();
    return super.headerModel;
  }

  @override
  set headerModel(HeaderModel? value) {
    _$headerModelAtom.reportWrite(value, super.headerModel, () {
      super.headerModel = value;
    });
  }

  final _$getCharactersAsyncAction =
      AsyncAction('_HomeControllerBase.getCharacters');

  @override
  Future getCharacters() {
    return _$getCharactersAsyncAction.run(() => super.getCharacters());
  }

  @override
  String toString() {
    return '''
headerModel: ${headerModel}
    ''';
  }
}
