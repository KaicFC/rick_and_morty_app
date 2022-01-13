// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DetailsController on _DetailsControllerBase, Store {
  final _$headerModelAtom = Atom(name: '_DetailsControllerBase.headerModel');

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

  final _$charactersModelAtom =
      Atom(name: '_DetailsControllerBase.charactersModel');

  @override
  CharactersModel? get charactersModel {
    _$charactersModelAtom.reportRead();
    return super.charactersModel;
  }

  @override
  set charactersModel(CharactersModel? value) {
    _$charactersModelAtom.reportWrite(value, super.charactersModel, () {
      super.charactersModel = value;
    });
  }

  final _$getCharacterByIdAsyncAction =
      AsyncAction('_DetailsControllerBase.getCharacterById');

  @override
  Future getCharacterById(int characterId) {
    return _$getCharacterByIdAsyncAction
        .run(() => super.getCharacterById(characterId));
  }

  @override
  String toString() {
    return '''
headerModel: ${headerModel},
charactersModel: ${charactersModel}
    ''';
  }
}
