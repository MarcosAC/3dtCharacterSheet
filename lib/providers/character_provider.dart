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
              force: character['force'],
              ability: character['ability'],
              resistance: character['resistance'],
              armor: character['armor'],
              firePower: character['firePower'],
              healthPoints: character['healthPoints'],
              magicPoints: character['magicPoints'],
              forceDamage: character['forceDamage'],
              firePowerDamage: character['firePowerDamage'],
              water: character['water'],
              air: character['air'],
              fire: character['fire'],
              light: character['light'],
              earth: character['earth'],
              darkness: character['darkness'],
              advantage: character['advantage'],
              disadvantage: character['disadvantage'],
              spells: character['spells'],
              moneyItems: character['moneyItems'],
              history: character['history'],
              experience: character['experience'],
            ))
        .toList();

    notifyListeners();
  }

  Future<void> updateCharacter(Character character) async {
    int index = _characters.indexWhere((characters) => characters.id == character.id);

    if (index >= 0) {
      Character newCharacter = Character(
        id: character.id,
        name: character.name,
        force: character.force,
        ability: character.ability,
        resistance: character.resistance,
        armor: character.armor,
        firePower: character.firePower,
        healthPoints: character.healthPoints,
        magicPoints: character.magicPoints,
        forceDamage: character.forceDamage,
        firePowerDamage: character.firePowerDamage,
        water: character.water,
        air: character.air,
        fire: character.fire,
        light: character.light,
        earth: character.earth,
        darkness: character.darkness,
        advantage: character.advantage,
        disadvantage: character.disadvantage,
        spells: character.spells,
        moneyItems: character.moneyItems,
        history: character.history,
        experience: character.experience,
      );

      DataBaseUtil.update('characters', newCharacter);
      _characters[index] = newCharacter;
      notifyListeners();
    }
  }

  Future<void> delete(int id) async {
    var character = characterById(id);
    DataBaseUtil.delete('characters', character!.id);
    //_characters.remove(character);
    final listCharacter = await DataBaseUtil.getAll('characters');
    _characters = _characters = listCharacter
        .map((character) => Character(
              id: character['id'],
              name: character['name'],
              force: character['force'],
              ability: character['ability'],
              resistance: character['resistance'],
              armor: character['armor'],
              firePower: character['firePower'],
              healthPoints: character['healthPoints'],
              magicPoints: character['magicPoints'],
              forceDamage: character['forceDamage'],
              firePowerDamage: character['firePowerDamage'],
              water: character['water'],
              air: character['air'],
              fire: character['fire'],
              light: character['light'],
              earth: character['earth'],
              darkness: character['darkness'],
              advantage: character['advantage'],
              disadvantage: character['disadvantage'],
              spells: character['spells'],
              moneyItems: character['moneyItems'],
              history: character['history'],
              experience: character['experience'],
            ))
        .toList();
    notifyListeners();
  }

  Character characterByIndex(int index) {
    return _characters[index];
  }

  Character? characterById(int id) {
    _characters = listCharacters.where((element) => element.id == id).toList();
    Character? newCharacter;

    for (var character in _characters) {
      newCharacter = Character(
          id: character.id,
          name: character.name,
          force: character.force,
          ability: character.ability,
          resistance: character.resistance,
          armor: character.armor,
          firePower: character.firePower,
          healthPoints: character.healthPoints,
          magicPoints: character.magicPoints,
          forceDamage: character.forceDamage,
          firePowerDamage: character.firePowerDamage,
          water: character.water,
          air: character.air,
          fire: character.fire,
          light: character.light,
          earth: character.earth,
          darkness: character.darkness,
          advantage: character.advantage,
          disadvantage: character.disadvantage,
          spells: character.spells,
          moneyItems: character.moneyItems,
          history: character.history,
          experience: character.experience);
    }

    return newCharacter;
  }

  List<Character> get listCharacters {
    return [..._characters];
  }

  int get itemsCount {
    return _characters.length;
  }
}
