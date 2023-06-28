import 'package:dtcharactersheet/models/character.dart';
import 'package:dtcharactersheet/utils/database/database_util.dart';
import 'package:flutter/material.dart';

class CharacterProvider with ChangeNotifier {
  List<Character> _characters = [];

  Future<void> addCharacter(Character character) async {
    DataBaseUtil.insert('characters', character.toMap());
    notifyListeners();
  }

  Future<void> loadCharacters() async {
    final listCharacter = await DataBaseUtil.getAll('characters');

    _characters = listCharacter
        .map((character) => Character(
              id: character['id'],
              name: character['name'],
              advantage: character['advantage'],
              disadvantage: character['disadvantage'],
              spells: character['spells'],
              moneyItems: character['moneyItems'],
              history: character['history'],
              healthPoints: character['healthPoints'],
              experience: character['experience'],
              magicPoints: character['magicPoints'],
              characteristics: character['characteristics'],
              waysOfMagic: character['waysOfMagic'],
              damageTypes: character['damageTypes'],
            ))
        .toList();

    notifyListeners();
  }
}
